//
//  ShapeFactory.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/6.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"


@interface ShapeFactory : NSObject

+ (Shape *)getShape;

@end

@interface CircleFactory : ShapeFactory

@end

@interface RectangleFactory : ShapeFactory

@end

@interface SquareFactory : ShapeFactory

@end


