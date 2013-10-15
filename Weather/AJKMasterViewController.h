//
//  AJKMasterViewController.h
//  Weather
//
//  Created by Alex John on 10/15/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AJKBookDataController;

@interface AJKMasterViewController : UITableViewController

@property (strong, nonatomic) AJKBookDataController *dataController;

@end
