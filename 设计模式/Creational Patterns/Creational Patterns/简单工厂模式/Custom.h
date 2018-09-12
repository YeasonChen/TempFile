//
//  Custom.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BuyerDelete<NSObject>
@required
- (void)buyGoods;

@end

@interface Custom : NSObject

@property (nonatomic, weak) id<BuyerDelete> delegate;

- (void)wantAGood;

@end
