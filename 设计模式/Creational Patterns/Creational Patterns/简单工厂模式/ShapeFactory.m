//
//  ShapeFactory.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/6.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import "ShapeFactory.h"

@implementation ShapeFactory

+ (Shape *)getShape{
    Shape *shape;
    shape = [[Shape alloc] init];
    return shape;
}
@end

@implementation CircleFactory

+ (Shape *)getShape{
    Shape *shape;
    shape = [[Circle alloc] init];
    return shape;
}
@end

@implementation RectangleFactory

+ (Shape *)getShape{
    Shape *shape;
    shape = [[Rectangle alloc] init];
    return shape;
}
@end

@implementation SquareFactory

+ (Shape *)getShape{
    Shape *shape;
    shape = [[Square alloc] init];
    return shape;
}
@end




