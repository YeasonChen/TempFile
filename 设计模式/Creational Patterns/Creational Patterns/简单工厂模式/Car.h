//
//  Car.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Road.h"

@interface Car : NSObject

@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, strong) id<Drive> RoadCondition;

- (void)running;

@end

@interface BMWCar : Car


@end

@interface FORDCar : Car

@end


