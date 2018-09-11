//
//  BrandFactory.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/10.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "BrandFactory.h"

@implementation BrandFactory

+ (Clothes *)createClothes {
    return [[Clothes alloc] init];
}

+ (Shoes *)createShoes {
    return [[Shoes alloc] init];
}

@end

@implementation BrandFactoryA

+ (Clothes *)createClothes {
    return (Clothes *)[[ClothesA alloc] init];
};

+ (Shoes *)createShoes {
    return (Shoes *)[[ShoesA alloc] init];
};

@end

@implementation BrandFactoryB

+ (Clothes *)createClothes {
    return (Clothes *)[[ClothesB alloc] init];
};

+ (Shoes *)createShoes {
    return (Shoes *)[[ShoesB alloc] init];
};

@end
