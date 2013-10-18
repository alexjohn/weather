//
//  AJKBookDataController.m
//  Weather
//
//  Created by Alex John on 10/15/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "AJKBookDataController.h"
#import "AJKBook.h"

@interface AJKBookDataController ()

// when current book uses the copy exception are thrown in addBookToList
@property (nonatomic) AJKBook  *currentBook;
@property (nonatomic, copy) NSString *currentValue;

- (void)populateBookList;
- (void)addBookToBookList;

@end

@implementation AJKBookDataController

- (id)init
{
    self = [super init];
    if (self) {
        _bookList = [[NSMutableArray alloc] init];
        _currentBook = [[AJKBook alloc] init];
        _currentValue = [[NSString alloc] init];
        [self populateBookList];
        return self;
    }
    return nil;
}

- (void)setBookList:(NSMutableArray *)bookList
{
    // this bit of code ensures bookList stays mutable
    if (_bookList != bookList) {
        _bookList = [bookList mutableCopy];
    }
}

- (void)populateBookList
{
    // i probably could have pointed this to a local directory
    NSURL *url = [NSURL URLWithString:@"https://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    [parser setDelegate:self];
    [parser parse];
    
    NSLog(@"%@", [self.bookList description]);
}

- (void)addBookToBookList
{
    [self.bookList addObject:self.currentBook];
    self.currentBook = [[AJKBook alloc] init];
}

- (NSUInteger)booksInBookList
{
    return [self.bookList count];
}

- (AJKBook *)bookAtIndex:(NSUInteger)index
{
    return [self.bookList objectAtIndex:index];
}

// nsxmlparserdelegate code

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"Book"]) {
        // [self.currentBook bookID:[[attrubuteDict objectForKey:@"id"] integerValue]];
        self.currentBook.bookID = [[attributeDict objectForKey:@"id"] integerValue];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    self.currentValue = [self.currentValue stringByAppendingString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"title"]) {
        // [self.currentBook title:self.currentValue];
        self.currentBook.title = self.currentValue;
    } else if ([elementName isEqualToString:@"author"]) {
        self.currentBook.author = self.currentValue;
    } else if ([elementName isEqualToString:@"summary"]) {
        self.currentBook.summary = self.currentValue;
    } else if ([elementName isEqualToString:@"Book"]) {
        [self addBookToBookList];
    }
    
    self.currentValue = [NSString stringWithFormat:@""];
}

@end
