//
//  Shoes.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/10.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "Shoes.h"

@implementation Shoes

- (id)copyWithZone:(NSZone *)zone {
    Shoes *shoes = [[Shoes allocWithZone:zone] init];
    // 此处可以runtime获取所有成员变量KVC循环赋值
    shoes.brand = self.brand;
    shoes.size = self.size;
    return shoes;
}


- (void)show {
    NSLog(@"Shoes Show");
}

@end

@implementation ShoesA

- (void)show {
    NSLog(@"ShoesA Show");
}

@end

@implementation ShoesB

- (void)show {
    NSLog(@"ShoesB Show");
}

@end
