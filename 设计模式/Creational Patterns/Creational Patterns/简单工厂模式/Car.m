//
//  Car.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)running {}

@end

@implementation BMWCar

- (instancetype)init {
    if (self = [super init]) {
        self.typeName = @"BMW";
    }
    return self;
}

- (void)running {
    [self.RoadCondition Drive:self.typeName];
}

@end

@implementation FORDCar

- (instancetype)init {
    if (self = [super init]) {
        self.typeName = @"FORD";
    }
    return self;
}

- (void)running {
    [self.RoadCondition Drive:self.typeName];
}

@end
