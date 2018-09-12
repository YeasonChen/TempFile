//
//  IgoChessman.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ChessmanType) {
    ChessmanTypeWhite,
    ChessmanTypeBlack
};

@interface IgoChessman : NSObject

@property (nonatomic, copy) NSString *position;
- (void)display:(NSString *)position;

@end

@interface IgoChessmanBlack : IgoChessman


@end

@interface IgoChessmanWhite : IgoChessman


@end
