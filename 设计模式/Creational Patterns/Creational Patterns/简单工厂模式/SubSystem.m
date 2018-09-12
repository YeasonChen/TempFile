//
//  SubSystem.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "SubSystem.h"

@implementation SubSystem

+ (NSString *)doWork:(NSString *)material {
    return [material stringByAppendingString:@"  doWork"];
}

@end

@implementation SubSystem1

+ (NSString *)doWork1:(NSString *)material {
    return [material stringByAppendingString:@"  doWork1"];
}

@end


@implementation SubSystem2

+ (NSString *)doWork2:(NSString *)material {
    return [material stringByAppendingString:@"  doWork2"];
}

@end

