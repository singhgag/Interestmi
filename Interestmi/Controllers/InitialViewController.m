//
//  InitialViewController.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "InitialViewController.h"
#import "LoginViewController.h"
#import "UIButton+Additions.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

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
    [self disableNavigationBar];
    [self setUpBackground];
    [self setUpContent];
}

- (void) setUpFrame
{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    [self setView:[[UIView alloc] initWithFrame:applicationFrame]];
}

- (void) disableNavigationBar
{
    [self.navigationController setNavigationBarHidden:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:128.0/255.0 green:0 blue:32.0/255.0 alpha:1]];
}

- (void) setUpBackground
{
    //UIImageView *backgroundView = [UIImageView imageViewWithImage:@"BlueBackground.png"];
    //[self.view addSubview:backgroundView];
    //[self.view setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BlueBackground.png"]]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setUpContent {
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    [logoView setFrame:CGRectOffset(logoView.frame, 10, 200)];
    [self.view addSubview:logoView];
    
    //sign up button
    UIButton *signUpButton = [UIButton buttonWithImage:nil backgroundImage:[UIImage imageNamed:@"ButtonBG.png"]
                                                target:nil action:nil];
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpButton setFrame:CGRectOffset(signUpButton.frame, 10, 440)];
    [signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:signUpButton];
    
    //login button
    UIButton *loginButton = [UIButton buttonWithImage:nil backgroundImage:[UIImage imageNamed:@"ButtonBG.png"] target:self action:@selector(loginAction)];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setFrame:CGRectOffset(loginButton.frame, 165, 440)];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    
    //facebook button
    UIButton *facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [facebookButton setImage:[UIImage imageNamed:@"FacebookButton.png"] forState:UIControlStateNormal];
    [facebookButton setFrame:CGRectMake(10, 480, 300, 56)];
    [self.view addSubview:facebookButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (void) loginAction {
    [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}

@end
