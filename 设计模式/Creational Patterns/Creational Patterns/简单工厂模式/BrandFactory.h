//
//  BrandFactory.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/10.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clothes.h"
#import "Shoes.h"

@interface BrandFactory : NSObject

+ (Clothes *)createClothes;
+ (Shoes *)createShoes;

@end


@interface BrandFactoryA : BrandFactory

@end

@interface BrandFactoryB : BrandFactory

@end



