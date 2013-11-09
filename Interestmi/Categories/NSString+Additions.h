//
//  NSString+Additions.h
//  prayground
//
//  Created by Gagandeep on 1/8/13.
//  Copyright (c) 2013 Gagandeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

+ (BOOL)isNilOrEmptyString:(NSString *)string;
+ (NSString *)deviceTokenFrom:(NSData *)data;

@end
