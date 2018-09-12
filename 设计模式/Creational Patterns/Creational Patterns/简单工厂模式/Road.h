//
//  Road.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Drive
- (void)Drive:(NSString *)price;
@end

@interface Road : NSObject<Drive>

@end

@interface FreeWay : NSObject<Drive>

@end
