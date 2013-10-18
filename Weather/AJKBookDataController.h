//
//  AJKBookDataController.h
//  Weather
//
//  Created by Alex John on 10/15/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AJKBook;

@interface AJKBookDataController : NSObject <NSXMLParserDelegate>

// Only nonatomic properties allow mixing and matching custom and synthesized accessors
@property (nonatomic) NSMutableArray *bookList;

- (NSUInteger)booksInBookList;
- (AJKBook *)bookAtIndex:(NSUInteger)index;

@end
