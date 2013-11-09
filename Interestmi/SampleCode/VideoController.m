//
//  VideoController.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "VideoController.h"
#import "VideoPlayer.h"
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>

@interface VideoController ()

@property (nonatomic, strong) VideoPlayer *videoPlayer;
//@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *index;

@end

@implementation VideoController

- (id)initWithIndex:(NSString*)index
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.index = index;
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
    [self.navigationItem setTitle:@"Browse"];
}

- (void) setUpBackground
{
    //UIImageView *backgroundView = [UIImageView imageViewWithImage:@"BlueBackground.png"];
    //[self.view addSubview:backgroundView];
    //[self.view setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BlueBackground.png"]]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setUpContent {
    //video player
    self.videoPlayer = [[VideoPlayer alloc] initWithFrame:CGRectMake(10, 10, 300, 300) index:self.index];
    
    [self.view addSubview:self.videoPlayer];
    
    //dislike button
    UIButton *dislikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dislikeButton setTitle:@"D" forState:UIControlStateNormal];
    [dislikeButton setImage:[UIImage imageNamed:@"DislikeButton.png"] forState:UIControlStateNormal];
    [dislikeButton setFrame:CGRectMake(70, 330, 79, 71)];
    [dislikeButton addTarget:self action:@selector(newSuggestion) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dislikeButton];
    
    //like button
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [likeButton setTitle:@"L" forState:UIControlStateNormal];
    [likeButton setFrame:CGRectMake(170, 331, 79, 71)];
    [likeButton setImage:[UIImage imageNamed:@"LikeButton.png"] forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(likeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:likeButton];
    
    //request connection button
    UIButton *connectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [connectionButton setImage:[UIImage imageNamed:@"ConnectionButton.png"] forState:UIControlStateNormal];
    [connectionButton setFrame:CGRectMake(70, 420, 180, 40)];
    [connectionButton addTarget:self action:@selector(requestAction) forControlEvents:UIControlEventTouchUpInside];
    [connectionButton.layer setBorderColor:[UIColor colorWithWhite:204.0/255.0 alpha:1].CGColor];
    [connectionButton.layer setBorderWidth:0.5];
    [self.view addSubview:connectionButton];
}

#pragma mark - actions

- (void)playVideo {
    [self.videoPlayer playVideo];
}

- (void)likeAction {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Added to the interest list!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)requestAction {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has been sent!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)newSuggestion {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PushSuggestions" object:nil];
}

-(void)dealloc {
    [self.videoPlayer cleanUp];
}

@end
