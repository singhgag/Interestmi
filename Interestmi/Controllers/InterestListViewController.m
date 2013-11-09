//
//  InterestListViewController.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "InterestListViewController.h"
#import "VideoController.h"
#import <QuartzCore/QuartzCore.h>

@interface InterestListViewController ()

@end

@implementation InterestListViewController

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
    [self.navigationItem setTitle:@"Interest List"];
}

- (void) setUpBackground
{
    //UIImageView *backgroundView = [UIImageView imageViewWithImage:@"BlueBackground.png"];
    //[self.view addSubview:backgroundView];
    //[self.view setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BlueBackground.png"]]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setUpContent {
    /*
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 300, 30)];
    [label setText:@"Interest List"];
    [label setFont:[UIFont systemFontOfSize:25]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    */
    int rows = 5;
    int columns = 3;
    
    for (int i = 0; i<rows; i++) {
        for (int j=0; j<columns; j++) {
            ThumbnailView *thumbnail = [[ThumbnailView alloc] initWithFrame:CGRectMake(10+j*104, i*102+10, 92, 92)
                                                                      index:[NSString stringWithFormat:@"%u",columns*i+j+1]];
            [self.view addSubview:thumbnail];
            [thumbnail setDelegate:self];
            [thumbnail.layer setCornerRadius:10];
            [thumbnail setClipsToBounds:YES];
        }
    }
}

#pragma mark - ThumbnailViewDelegate methods

-(void)thumbnailButtonPressed:(UIButton *)button {
    [self.navigationController pushViewController:[[VideoController alloc] initWithIndex:[NSString stringWithFormat:@"%u", button.tag]] animated:YES];
}

@end
