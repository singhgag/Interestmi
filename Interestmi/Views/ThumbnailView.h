//
//  ThumbnailView.h
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ThumbnailViewDelegate <NSObject>

-(void)thumbnailButtonPressed:(UIButton*)button;

@end

@interface ThumbnailView : UIView

@property (nonatomic, strong) id <ThumbnailViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame index:(NSString*)index;

@end
