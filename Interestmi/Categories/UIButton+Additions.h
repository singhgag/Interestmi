//
//  UIButton+Additions.h
//  prayground
//
//  Created by Gagandeep on 12/13/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

+ (id)buttonWith:(UIImage *)backgroundImage
          target:(id)target action:(SEL)selector;
+ (id)buttonWithImage:(UIImage*)image backgroundImage:(UIImage *)backgroundImage
               target:(id)target action:(SEL)selector;
+ (id)buttonWithImage:(UIImage *)image background:(UIImage *)background
                frame:(CGRect)frame target:(id)target action:(SEL)selector;
+ (id)buttonWithTitle:(NSString*)title background:(UIImage*)background
                frame:(CGRect)frame target:(id)target action:(SEL)selector;

@end
