//
//  ChessmanFactory.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IgoChessman.h"

@interface ChessmanFactory : NSObject

+ (instancetype)shareInstance;

- (IgoChessman *)getChessman:(ChessmanType)type;

@end
