//
//  Fade.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "Fade.h"
#import "SubSystem.h"

@implementation Fade

- (NSString *)DoComplexWork:(NSString *)material {
    NSString *result = [SubSystem doWork:material];
    result = [SubSystem1 doWork1:result];
    return [SubSystem2 doWork2:result];
}

@end
