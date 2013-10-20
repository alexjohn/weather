//
//  AJKDetailViewController.m
//  Weather
//
//  Created by Alex John on 10/15/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "AJKDetailViewController.h"
#import "AJKBook.h"

@interface AJKDetailViewController ()
- (void)configureView;
@end

@implementation AJKDetailViewController

#pragma mark - Managing the detail item

- (void)setBook:(AJKBook *)newBook
{
    if (_book != newBook) {
        _book = newBook;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    AJKBook *theBook = self.book;
    
    if (theBook) {
        self.bookTitle.text = theBook.title;
        self.bookAuthor.text = theBook.author;
        self.bookSummary.text = theBook.summary;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
