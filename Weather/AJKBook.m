//
//  AJKBook.m
//  Weather
//
//  Created by Alex John on 10/15/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "AJKBook.h"

@implementation AJKBook

- (AJKBook *)initWithID:(NSInteger)bookID title:(NSString *)title author:(NSString *)author summary:(NSString *)summary
{
    self = [super init];
    if (self) {
        _bookID = bookID;
        _title = title;
        _author = author;
        _summary = summary;
        return self;
    }
    return nil;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%ld %@ %@", (long)self.bookID, self.title, self.author];
}

@end
