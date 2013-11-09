//
//  UITextField+Additions.m
//  prayground
//
//  Created by Gagandeep on 12/15/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "UITextField+Additions.h"
#import "UIFont+Additions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UITextField (Additions)

//custom text field with default font size and style
+ (id) customFieldWithPlaceholder:(NSString*)placeholder
{
    UITextField *textField = [[UITextField alloc] init];
    [textField setPlaceholder:placeholder];
    [textField setFont:[UIFont regularHelveticaNeueofSize:15]];
    [textField setBorderStyle:UITextBorderStyleNone];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textField setTextColor:[UIColor colorWithRed:40/255.0 green:42/255.0 blue:48/255.0 alpha:1.0]];
    //[textField.layer setCornerRadius:0.01f];
    [textField setBackground:[UIImage imageNamed:@"TextFieldBackground.png"]];
    [textField setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    //adding left padding
    [textField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] ];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    return textField;
}

@end
