//
//  main.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/6.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapeFactory.h"
#import "BrandFactory.h"
#import "CarBuilder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 动态获取的类名
//        NSString *serverStr = @"BrandFactoryA";
//        Class cls = NSClassFromString(serverStr);
//        ClothesA *clothesA;
//        ShoesA *shoesA;
//        if ([cls respondsToSelector:@selector(createClothes)]) {
//            clothesA = (ClothesA *)[cls performSelector:@selector(createClothes)];
//        }
//        if ([cls respondsToSelector:@selector(createShoes)]) {
//            shoesA = (ShoesA *)[cls performSelector:@selector(createShoes)];
//        }
//        [clothesA show];
//        [shoesA show];
        
//        Shoes *shoes1 = [[Shoes alloc] init];
//        shoes1.size = 41;
//        shoes1.brand = @"Nike";
//        Shoes *shoes2 = [shoes1 copy];
//        NSLog(@"%@", shoes2.brand);
        Car *car = [BMWCarBuilder BuildCar];
        NSLog(@"%@", car.AutoMachine);
    }
    return 0;
}
