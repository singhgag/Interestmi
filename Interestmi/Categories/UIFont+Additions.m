//
//  UIFont+Additions.m
//  prayground
//
//  Created by Gagandeep on 12/13/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "UIFont+Additions.h"

@implementation UIFont (Additions)

+ (UIFont*) regularHelveticaNeueofSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont*) boldHelveticaNeueofSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (UIFont*) lightHelveticaNeueofSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (UIFont*) italicHelveticaNeueofSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Italic" size:size];
}

@end
