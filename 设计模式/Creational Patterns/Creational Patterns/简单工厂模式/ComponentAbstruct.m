//
//  Component.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "ComponentAbstruct.h"

@implementation ComponentAbstruct

- (void)showInformation {}
- (void)addComponent:(ComponentAbstruct *)c {}
- (void)delComponent {}
- (ComponentAbstruct *)getComponent:(NSInteger)index {return nil;}

@end


@implementation Leaf

- (void)showInformation {
    NSLog(@"这是叶子节点\n");
}

@end


@implementation Composite
{
    NSMutableArray <ComponentAbstruct *> *componentArrayM;
}

- (instancetype)init {
    if (self = [super init]) {
        componentArrayM = [NSMutableArray array];
    }
    return self;
}

- (void)showInformation {
    NSLog(@"这是容器节点---\n");
    for (ComponentAbstruct *ab in componentArrayM) {
        [ab showInformation];
    }
}

- (void)addComponent:(ComponentAbstruct *)c {
    [componentArrayM addObject:c];
}

- (void)delComponent {
    if (componentArrayM.count) {
        [componentArrayM removeLastObject];
    }
}

- (ComponentAbstruct *)getComponent:(NSInteger)index {
    return componentArrayM[index];
}

@end


