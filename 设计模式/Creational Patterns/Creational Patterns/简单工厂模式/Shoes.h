//
//  Shoes.h
//  Creational Patterns
//
//  Created by Yeason on 2018/9/10.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shoes : NSObject<NSCopying>

@property (nonatomic, assign) NSInteger size;
@property (nonatomic, copy) NSString *brand;

- (void)show;

@end



@interface ShoesA : Shoes

@end

@interface ShoesB : Shoes

@end
