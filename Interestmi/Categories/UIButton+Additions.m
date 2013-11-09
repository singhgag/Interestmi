//
//  UIButton+Additions.m
//  prayground
//
//  Created by Gagandeep on 12/13/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "UIButton+Additions.h"
#import "UIFont+Additions.h"

@implementation UIButton (Additions)

+ (id)buttonWith:(UIImage *)backgroundImage
          target:(id)target action:(SEL)selector {
    return [UIButton buttonWithImage:nil
                          background:backgroundImage
                               frame:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)
                              target:target
                              action:selector];
}

+ (id)buttonWithImage:(UIImage*)image backgroundImage:(UIImage *)backgroundImage
          target:(id)target action:(SEL)selector {
    return [UIButton buttonWithImage:image
                          background:backgroundImage
                               frame:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)
                              target:target
                              action:selector];
}

+ (id)buttonWithImage:(UIImage *)image background:(UIImage *)background
                frame:(CGRect)frame target:(id)target action:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:background forState:UIControlStateNormal];
    [button setFrame:frame];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (id)buttonWithTitle:(NSString*)title background:(UIImage*)background frame:(CGRect)frame target:(id)target action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithImage:nil
                                      background:background
                                           frame:frame
                                          target:target
                                          action:selector];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldHelveticaNeueofSize:12]];
    return button;
}

@end
