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

// need some temporary strings/dictionary here to contain book data
@property (copy) NSString *elementName;

- (void)populateBookList;

@end

@implementation AJKBookDataController

- (id)init
{
    self = [super init];
    if (self) {
        _bookList = [[NSMutableArray alloc] init];
        [self populateBookList];
        return self;
    }
    return nil;
}

- (void)populateBookList
{
    // i probably could have pointed this to a local directory as well
    NSURL *url = [NSURL URLWithString:@"https://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    [parser setDelegate:self];
    [parser parse];
}

- (void)setBookList:(NSMutableArray *)bookList
{
    // this bit of code ensures bookList stays mutable
    if (_bookList != bookList) {
        _bookList = [bookList mutableCopy];
    }
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
    // NSLog(@"%@", elementName);
    self.elementName = elementName;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"%@ %@", self.elementName, string);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // NSLog(@"%@", elementName);
}

@end
