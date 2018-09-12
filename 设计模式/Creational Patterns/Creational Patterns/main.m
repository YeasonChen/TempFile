//
//  main.m
//  Creational Patterns
//
//  Created by Yeason on 2018/9/6.
//  Copyright © 2018年 CosBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapeFactory.h"
#import "BrandFactory.h"
#import "CarBuilder.h"
#import "Adapter.h"
#import "Car.h"
#import "ComponentAbstruct.h"
#import "YSraw+Ct.h"
#import "Fade.h"
#import "BuyerClass.h"
#import "ChessmanFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 动态获取的类名
//        NSString *serverStr = @"BrandFactoryA";
//        Class cls = NSClassFromString(serverStr);
//        ClothesA *clothesA;
//        ShoesA *shoesA;
//        if ([cls respondsToSelector:@selector(createClothes)]) {
//            clothesA = (ClothesA *)[cls performSelector:@selector(createClothes)];
//        }
//        if ([cls respondsToSelector:@selector(createShoes)]) {
//            shoesA = (ShoesA *)[cls performSelector:@selector(createShoes)];
//        }
//        [clothesA show];
//        [shoesA show];
        
//        Shoes *shoes1 = [[Shoes alloc] init];
//        shoes1.size = 41;
//        shoes1.brand = @"Nike";
//        Shoes *shoes2 = [shoes1 copy];
//        NSLog(@"%@", shoes2.brand);
//        Car *car = [BMWCarBuilder BuildCar];
//        NSLog(@"%@", car.AutoMachine);
        
        
        
//        Adapter *ad = [[Adapter alloc] init];
//        [ad useLib1Func];
//        [ad useLib2Func];
        
//        BMWCar *car = [[BMWCar alloc] init];
//        FreeWay *fw = [[FreeWay alloc] init];
//        [car setRoadCondition:fw];
//        [car running];
        
        
//        ComponentAbstruct *leaf1 = [[Leaf alloc] init];
//        ComponentAbstruct *leaf2 = [[Leaf alloc] init];
//        ComponentAbstruct *leaf3 = [[Leaf alloc] init];
//        ComponentAbstruct *composite1 = [[Composite alloc] init];
//        ComponentAbstruct *composite2 = [[Composite alloc] init];
//
//        [composite1 addComponent:composite2];
//        [composite1 addComponent:leaf1];
//        [composite1 addComponent:leaf2];
//
//        [composite2 addComponent:leaf3];
//
//        [composite1 showInformation];
        
        
//        NSLog(@"%@", [[[Fade alloc] init] DoComplexWork:@"Original"]);
        
//        BuyerClass *by = [[BuyerClass alloc] init];
//        Custom *cs = [[Custom alloc] init];
//        cs.delegate = by;
//        [cs wantAGood];
        IgoChessman *chessman = [[ChessmanFactory shareInstance] getChessman:ChessmanTypeBlack];
        IgoChessman *chessman1 = [[ChessmanFactory shareInstance] getChessman:ChessmanTypeBlack];
        IgoChessman *chessman2 = [[ChessmanFactory shareInstance] getChessman:ChessmanTypeBlack];
        [chessman display:@"(12, 23)"];
    }
    return 0;
}
