//
//  NSString+Additions.m
//  prayground
//
//  Created by Gagandeep on 1/8/13.
//  Copyright (c) 2013 Gagandeep. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

+ (BOOL)isNilOrEmptyString:(NSString *)string {
    return string == nil || string.length == 0;
}

+ (NSString *)deviceTokenFrom:(NSData *)data
{
    return [[[[data description]
              stringByReplacingOccurrencesOfString:@"<" withString:@""]
             stringByReplacingOccurrencesOfString:@">" withString:@""]
            stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
