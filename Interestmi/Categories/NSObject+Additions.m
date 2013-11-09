//
//  NSObject+Additions.m
//  prayground
//
//  Created by Gagandeep on 12/20/12.
//  Copyright (c) 2012 Gagandeep. All rights reserved.
//

#import "NSObject+Additions.h"

@implementation NSObject (Additions)

+ (id)nullSafeConversion:(id)source {
    if (source == nil || [source isKindOfClass:[NSNull class]]) {
        return nil;
    } else {
        return source;
    }
}

@end
