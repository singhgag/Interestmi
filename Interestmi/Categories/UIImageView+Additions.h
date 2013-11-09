//
//  UIImageView+Additions.h
//  prayground
//
//  Created by Gagandeep on 12/14/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Additions)

+ (id) imageViewWithImage:(NSString*)imageName;
+ (id) imageViewWithImage:(NSString*)imageName startPosX:(uint)startPosX startPosY:(uint)startPosY;

@end
