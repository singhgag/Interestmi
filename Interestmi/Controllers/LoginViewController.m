//
//  LoginViewController.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "LoginViewController.h"
#import "JASidePanelController.h"
#import "GlobalMenuViewController.h"
#import "CameraController.h"
#import "VideoController.h"
#import "InterestListViewController.h"
#import "UIButton+Additions.h"

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@end

@implementation LoginViewController

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
    [logoView setFrame:CGRectOffset(logoView.frame, 10, 100)];
    [self.view addSubview:logoView];
    
    //email textfield
    self.emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 30)];
    [self.emailTextField setPlaceholder:@"Email"];
    [self.emailTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.emailTextField];
    
    //password textfield
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 240, 300, 30)];
    [self.passwordTextField setPlaceholder:@"Password"];
    [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.view addSubview:self.passwordTextField];
    
    //login button
    UIButton *loginButton = [UIButton buttonWithImage:nil backgroundImage:[UIImage imageNamed:@"ButtonBG.png"] target:self action:@selector(openFeedsView)];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setFrame:CGRectOffset(loginButton.frame, 85, 300)];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) openFeedsView
{
    JASidePanelController *controller = [[JASidePanelController alloc] init];
    //[controller setDelegate:self];
    controller.leftPanel = [[GlobalMenuViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[VideoController alloc] initWithIndex:@"1"]];
    //[navigationController setValue:[[CustomNavigationBar alloc] init] forKey:@"navigationBar"];
    controller.centerPanel = navigationController;
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

@end
