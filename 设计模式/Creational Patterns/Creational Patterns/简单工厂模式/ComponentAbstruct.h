//
//  Component.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/12.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComponentAbstruct : NSObject

- (void)showInformation;
- (void)addComponent:(ComponentAbstruct *)c;
- (void)delComponent;
- (ComponentAbstruct *)getComponent:(NSInteger)index;

@end

@interface Leaf : ComponentAbstruct

@end

@interface Composite : ComponentAbstruct

@end
