//
//  CarBuilder.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface CarBuilder : NSObject

+ (Car *)BuildCar;

+ (void)BuildPartSteeringWheel:(Car *)car;
+ (void)BuildPartWheel:(Car *)car;
+ (void)BuildPartEngine:(Car *)car;
+ (void)BuildPartAutoMachine:(Car *)car;

@end

@interface BMWCarBuilder : CarBuilder


@end


