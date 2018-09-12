//
//  Library.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AdapterProtocol

@required
- (void)useLib1Func;
@optional
- (void)useLib2Func;

@end

@interface Library : NSObject

- (void)libraryFunc;

@end

@interface Library2 : NSObject

- (void)library2Func;

@end
