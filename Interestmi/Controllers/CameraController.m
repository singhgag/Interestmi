//
//  CameraController.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "CameraController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface CameraController ()

@property (nonatomic, strong) UIImagePickerController *cameraPicker;

@end

@implementation CameraController

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
    [self disableNavigationBar];
    [self setUpCamera];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) disableNavigationBar
{
    [UIApplication sharedApplication].statusBarHidden = YES;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setUpCamera {
    if (!self.cameraPicker) {
        self.cameraPicker = [[UIImagePickerController alloc] init];
        self.cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.cameraPicker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
        self.cameraPicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        
        self.cameraPicker.delegate = self;
        self.cameraPicker.wantsFullScreenLayout = NO;
        self.cameraPicker.allowsEditing = YES;
        self.cameraPicker.showsCameraControls = YES;
        
        [self presentModalViewController:self.cameraPicker animated:YES];
    }
}

@end
