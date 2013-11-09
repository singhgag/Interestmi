//
//  RequestCell.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import "RequestCell.h"
#import "ThumbnailView.h"

@implementation RequestCell

- (id)initWithIndex:(NSString*)index name:(NSString*)name time:(NSString*)time
{
    self = [super init];
    if (self) {
        // Initialization code
        ThumbnailView *thumbnailView = [[ThumbnailView alloc] initWithFrame:CGRectMake(10, 10, 70, 70) index:index];
        [self addSubview:thumbnailView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 35, 70, 20)];
        [nameLabel setText:name];
        [nameLabel setTextColor:[UIColor blackColor]];
        [nameLabel setBackgroundColor:[UIColor clearColor]];
        [nameLabel setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:nameLabel];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 35, 100, 20)];
        [timeLabel setText:time];
        [timeLabel setTextColor:[UIColor blackColor]];
        [timeLabel setBackgroundColor:[UIColor clearColor]];
        [timeLabel setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:timeLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
