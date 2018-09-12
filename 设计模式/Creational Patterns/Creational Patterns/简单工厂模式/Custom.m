//
//  Custom.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "Custom.h"

@implementation Custom

- (void)wantAGood {
    NSLog(@"想要一个商品");

    if ([self.delegate respondsToSelector:@selector(buyGoods)]) {
        [self.delegate buyGoods];
    }
}

@end
