//
//  YSraw+Ct.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "YSraw+Ct.h"
#import <objc/runtime.h>

@implementation YSraw (Ct)



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)find {
    uint count;
    Method *method_list = class_copyMethodList([self class], &count);
    
    for (int i = count - 1; i > 0; i --) {
        Method me = method_list[i];
        if (method_getName(me) == @selector(find)) {
            IMP imp = method_getImplementation(me);
            
            typedef void (*fn)(id,SEL);
            fn f = (fn)imp;
            f(self,@selector(find));
        }
    }
    free(method_list);
    
    NSLog(@"修改后的find");
}
#pragma clang diagnostic pop

- (void)externFind {
    NSLog(@"增加功能");
    [self find];
}

@end
