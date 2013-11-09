//
//  VideoPlayer.h
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPlayer : UIView

- (id)initWithFrame:(CGRect)frame index:(NSString*)index;
- (void)playVideo;
- (UIImage*)thumbnail;
- (void)cleanUp;
- (BOOL)isFullScreen;
-(void)setFullScreen:(BOOL)doFullScreen animated:(BOOL)animated;

@end
