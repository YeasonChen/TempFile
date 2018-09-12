//
//  SubSystem.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubSystem : NSObject

+ (NSString *)doWork:(NSString *)material;

@end

@interface SubSystem1 : NSObject
+ (NSString *)doWork1:(NSString *)material;
@end

@interface SubSystem2 : NSObject
+ (NSString *)doWork2:(NSString *)material;
@end
