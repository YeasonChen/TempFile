//
//  Adapter.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/11.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "Adapter.h"

@implementation Adapter
{
    Library *_lib1;
    Library2 * _lib2;
}

- (instancetype)init {
    if (self = [super init]) {
        _lib1 = [[Library alloc] init];
        _lib2 = [[Library2 alloc] init];
    }
    return self;
}

- (void)useLib1Func {
    [_lib1 libraryFunc];
}

//- (void)useLib2Func {
//    [_lib2 library2Func];
//}

@end
