//
//  UIViewController+Additions.m
//  prayground
//
//  Created by Gagandeep on 12/14/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "UIViewController+Additions.h"
#import "UIFont+Additions.h"
#import "GlobalMenuViewController.h"
#import "PrayerListViewController.h"
#import "CustomNavigationBar.h"
#import "JASidePanelController.h"

@implementation UIViewController (Additions)

- (UILabel*)getNavigationBarTitle:(NSString *)text {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = text;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldHelveticaNeueofSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.shadowColor = [UIColor blackColor];
    titleLabel.shadowOffset = CGSizeMake(0, -1);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    return titleLabel;
}

- (void)setNavigationBarLeftButton:(UIButton *)button {
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setNavigationBarRightButton:(UIButton *)button {
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
