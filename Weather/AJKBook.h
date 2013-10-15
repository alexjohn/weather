//
//  AJKBook.h
//  Weather
//
//  Created by Alex John on 10/15/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJKBook : NSObject

@property (nonatomic)       NSInteger bookID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *summary;

- (AJKBook *)initWithID:(NSInteger)bookID title:(NSString *)title author:(NSString *)author summary:(NSString *)summary;
- (NSString *)description;

@end
