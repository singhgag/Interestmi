//
//  UIImageView+Additions.m
//  prayground
//
//  Created by Gagandeep on 12/14/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "UIImageView+Additions.h"

@implementation UIImageView (Additions)

+ (id) imageViewWithImage:(NSString*)imageName
{
    return [UIImageView imageViewWithImage:imageName startPosX:0 startPosY:0];
}

+ (id) imageViewWithImage:(NSString*)imageName startPosX:(uint)startPosX startPosY:(uint)startPosY
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(startPosX, startPosY, image.size.width, image.size.height)];
    [imageView setImage:image];
    return imageView;
}

@end
