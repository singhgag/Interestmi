//
//  GlobalMenuViewController.m
//  prayground
//
//  Created by Gagandeep on 12/13/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "GlobalMenuViewController.h"
#import "GlobalMenuCell.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "AppDelegate.h"
#import "CameraController.h"
#import "VideoController.h"
#import "InterestListViewController.h"
#import "RequestListViewController.h"
#import "MessagesViewController.h"

@interface GlobalMenuViewController ()

@property (nonatomic, assign) int index;

@end

@implementation GlobalMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.index = 1;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushSuggestions) name:@"PushSuggestions" object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setUpBackground];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void) setUpBackground
{
    [self.tableView setBackgroundColor:[UIColor colorWithWhite:50.0/255.0 alpha:1.0]];
    //[self.tableView setBackgroundColor:[UIColor grayColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    GlobalMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[GlobalMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    switch (indexPath.row)
    {
        case 0:
            [cell.textLabel setText:@"Jeanine"];
            [cell.imageView setImage:[UIImage imageNamed:@"AvatarIcon.png"]];
            break;
        case 1:
            [cell.textLabel setText:@"Browse"];
            [cell.imageView setImage:[UIImage imageNamed:@"BrowseIcon.png"]];
            break;
        case 2:
            [cell.textLabel setText:@"Messages"];
            [cell.imageView setImage:[UIImage imageNamed:@"MessagesIcon.png"]];
            break;
        case 3:
            [cell.textLabel setText:@"Interest List"];
            [cell.imageView setImage:[UIImage imageNamed:@"InterestIcon.png"]];
            break;
        case 4:
            [cell.textLabel setText:@"Connection Requests"];
            [cell.imageView setImage:[UIImage imageNamed:@"HeartIcon.png"]];
            break;
        case 5:
            [cell.textLabel setText:@"Change Intro Video"];
            [cell.imageView setImage:[UIImage imageNamed:@"VideoIcon.png"]];
            break;
        case 6:
            [cell.textLabel setText:@"Settings"];
            [cell.imageView setImage:[UIImage imageNamed:@"SettingsIcon.png"]];
            break;
        case 7:
            [cell.textLabel setText:@"Account"];
            [cell.imageView setImage:[UIImage imageNamed:@"AccountIcon.png"]];
            break;
        case 8:
            [cell.textLabel setText:@"Logout"];
            [cell.imageView setImage:[UIImage imageNamed:@"LogoutIcon.png"]];
            break;
        case 9:
            [cell.textLabel setText:@"Tell Your Friends"];
            [cell.imageView setImage:[UIImage imageNamed:@"SmileyIcon.png"]];
            break;
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            break;
        case 1:
            [self displayAsCenterPanel:[[VideoController alloc] initWithIndex:@"1"]];
            break;
        case 2:
            [self displayAsCenterPanel:[[MessagesViewController alloc] init]];
            break;
        case 3:
            [self displayAsCenterPanel:[[InterestListViewController alloc] init]];
            break;
        case 4:
            [self displayAsCenterPanel:[[RequestListViewController alloc] init]];
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        case 9:
            break;
        default:
            break;
    
    }
}

- (void)displayAsCenterPanel:(UIViewController *)controller {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    //[navigationController setValue:[[CustomNavigationBar alloc] init] forKey:@"navigationBar"];
    self.sidePanelController.centerPanel = navigationController;
    [self.sidePanelController showCenterPanel:YES];
}

- (void) logout
{
    /*
    NSLog(@"Logout");
    //call the logout api
    UserRepository *userRepository = [[UserRepository alloc] init];
    [userRepository logout:^(id object, NSError *error) {
        if (error)
        {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
        else if (object)
        {
            [SVProgressHUD showErrorWithStatus:object];
        }
        else
        {
            //log out was successful
            if (FBSession.activeSession.isOpen)
            {
                [FBSession.activeSession closeAndClearTokenInformation];
            }
            [self.sidePanelController logout];
        }
    }];
    */
}

#pragma mark - notifications

- (void)pushSuggestions {
    NSLog(@"index from global menu :: %u", (self.index%12)+1);
    [self displayAsCenterPanel:[[VideoController alloc] initWithIndex:[NSString stringWithFormat:@"%u", (self.index%12)+1]]];
    self.index++;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
