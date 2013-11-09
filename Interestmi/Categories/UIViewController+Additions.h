//
//  UIViewController+Additions.h
//  prayground
//
//  Created by Gagandeep on 12/14/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

- (UILabel*)getNavigationBarTitle:(NSString *)text;
- (void)setNavigationBarLeftButton:(UIButton *)button;
- (void)setNavigationBarRightButton:(UIButton *)button;

@end
