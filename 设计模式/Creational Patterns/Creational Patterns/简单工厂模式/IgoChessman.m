//
//  IgoChessman.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "IgoChessman.h"

@interface IgoChessman ()
@property (nonatomic, copy) NSString *name;
@end

@implementation IgoChessman

- (void)display:(NSString *)position {
    NSLog(@"%@ 位置：%@", self.name, position);
}

@end

@implementation IgoChessmanBlack

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"IgoChessmanBlack";
    }
    return self;
}

@end

@implementation IgoChessmanWhite

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"IgoChessmanWhite";
    }
    return self;
}

@end
