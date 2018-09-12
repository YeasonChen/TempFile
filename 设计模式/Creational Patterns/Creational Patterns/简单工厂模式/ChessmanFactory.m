//
//  ChessmanFactory.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "ChessmanFactory.h"

@implementation ChessmanFactory
{
    NSMutableDictionary *pool_;
}
static ChessmanFactory *instance_;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[ChessmanFactory alloc] init];
    });
    return instance_;
}

- (instancetype)init {
    if (self = [super init]) {
        pool_ = [NSMutableDictionary dictionary];
    }
    return self;
}

- (IgoChessman *)getChessman:(ChessmanType)type {
    IgoChessman *chessman = [pool_ valueForKey:[NSString stringWithFormat:@"%zd", type]];
    if (!chessman) {
        if (type == ChessmanTypeBlack) {
            chessman = [[IgoChessmanBlack alloc] init];
        } else {
            chessman = [[IgoChessmanWhite alloc] init];
        }
        [pool_ setValue:chessman forKey:[NSString stringWithFormat:@"%zd", type]];
    }
    return chessman;
}

@end
