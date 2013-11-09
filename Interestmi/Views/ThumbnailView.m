//
//  ThumbnailView.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "ThumbnailView.h"

@implementation ThumbnailView

- (id)initWithFrame:(CGRect)frame index:(NSString*)index
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *thumbnail = [[UIImageView alloc] initWithFrame:self.bounds];
        [thumbnail setImage:[UIImage imageNamed:[NSString stringWithFormat:@"thumbnail%@.png", index]]];
        [self addSubview:thumbnail];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"PlayButton.png"] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(self.bounds.size.width/2 - 15, self.bounds.size.height/2 - 15, 30, 30)];
        [button setTag:[index intValue]];
        NSLog(@"index :: %u", button.tag);
        [button addTarget:self.delegate action:@selector(thumbnailButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

@end
