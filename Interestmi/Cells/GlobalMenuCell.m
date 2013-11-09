//
//  GlobalMenuCell.m
//  prayground
//
//  Created by Gagandeep on 12/13/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "GlobalMenuCell.h"
#import <QuartzCore/QuartzCore.h>
#import "UIFont+Additions.h"
#import "UIImageView+Additions.h"

@implementation GlobalMenuCell
@synthesize separatorView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.textLabel setFont:[UIFont systemFontOfSize:18]];
        [self.textLabel setTextColor:[UIColor colorWithWhite:200.0/255.0 alpha:1.0]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setSeparatorView];
    }
    return self;
}

- (void) setSeparatorView
{
    self.separatorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GlobalMenuSeparator.png"]];
    [self.separatorView setAlpha:0.5];
    [self addSubview:separatorView];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x + 5, self.imageView.frame.origin.y, self.imageView.image.size.width, self.imageView.image.size.height);
    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x + 5, self.textLabel.frame.origin.y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    self.separatorView.frame = CGRectMake(0, self.bounds.size.height - 2, self.bounds.size.width, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
