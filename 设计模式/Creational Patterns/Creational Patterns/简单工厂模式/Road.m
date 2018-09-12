//
//  Road.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "Road.h"


@implementation Road

- (void)Drive:(NSString *)price {
    NSLog(@"%@ drive on road", price);
}

@end

@implementation FreeWay

- (void)Drive:(NSString *)price {
    NSLog(@"%@ drive on FreeWay", price);
}

@end
