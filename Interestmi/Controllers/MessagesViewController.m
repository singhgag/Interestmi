//
//  MessagesViewController.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/16/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setUpFrame];
    [self setUpNavigationBar];
    [self setUpBackground];
    [self setUpContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpFrame
{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    [self setView:[[UIView alloc] initWithFrame:applicationFrame]];
}

- (void) setUpNavigationBar
{
    //[self.navigationController setNavigationBarHidden:YES];
    [self.navigationItem setTitle:@"Messages"];
}

- (void) setUpBackground
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setUpContent {
    UIImageView *messageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messages1.png"]];
    [messageView setFrame:CGRectOffset(messageView.frame, 13, 10)];
    [self.view addSubview:messageView];
    
    UIImageView *messageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messages2.png"]];
    [messageView2 setFrame:CGRectOffset(messageView2.frame, 0, 450)];
    [self.view addSubview:messageView2];
}

@end
