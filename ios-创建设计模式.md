#### 简单工厂模式（Static Factory Method）

**简单工厂模式：定义一个工厂类，它可以根据参数的不同返回不同类的实例，被创建的实例通常都具有共同的父类。**

**它由三种角色组成：**

`工厂类角色：`这是本模式的核心，含有一定的判断逻辑，根据逻辑不同，产生具体的工厂产品。如例子中的ShapeFactory 
`抽象产品角色：`它一般是具体产品继承的父类或者实现的接口。由接口或者抽象类来实现。如例中的Shape 基类。
`具体产品角色：`工厂类所创建的对象就是此角色的实例。在oc中由一个具体类实现，如例子中的Circle 、Rectangle类



产品基类以及具体产品角色

```objective-c
#import <Foundation/Foundation.h>


@interface Shape : NSObject

- (void)draw;

@end


@interface Circle : Shape

@end

@interface Rectangle : Shape

@end

@interface Square : Shape

@end

    
#import "Shape.h"

@implementation Shape

- (void)draw {
    NSLog(@"Shape draw");
}

@end

@implementation Square

- (void)draw {
    NSLog(@"Square draw");
}

@end


@implementation Circle

- (void)draw {
   NSLog(@"Circle draw");
}

@end
    
```



工厂类

```objective-c
#import <Foundation/Foundation.h>
#import "Shape.h"

typedef NS_ENUM(NSInteger, ShapeType) {
    ShapeCircle,
    ShapeRectangle,
    ShapeSquare
};

@interface ShapeFactory : NSObject

+ (Shape *)getShape:(ShapeType)type;

@end


#import "ShapeFactory.h"

@implementation ShapeFactory

+ (Shape *)getShape:(ShapeType)type {
    Shape *shape;
    switch (type) {
        case ShapeCircle:
            shape = [[Circle alloc] init];
            break;
        case ShapeRectangle:
            shape = [[Rectangle alloc] init];
            break;
        case ShapeSquare:
            shape = [[Square alloc] init];
            break;

        default:
            break;
    }
    return shape;
}

@end
```

 使用

```objective-c
Shape *shape = [ShapeFactory getShape:ShapeCircle];
[shape draw];
```

 

 **1. 主要优点**

​       (1) 使用者不需要注意产品创建过程，只需要传入需要的产品类型。

**2. 主要缺点**

​       (1) 增加了类，加大了复杂性

​       (2) 工厂类中包含过多逻辑，职责过重。 

**3. 适用场景**

​       (1) 工厂类负责创建的对象比较少，由于创建的对象较少，不会造成工厂方法中的业务逻辑太过复杂。

 

 #### 工厂模式(Factory Method Pattern)

**工厂方法模式：定义一个工厂类的基类，对于每种产品各自添加对应的工厂类，负责相应产品的创建**



工厂类及基类

```objective-c
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

```



产品类及基类

```objective-c
#import <Foundation/Foundation.h>


@interface Shape : NSObject

- (void)draw;

@end


@interface Circle : Shape

@end

@interface Rectangle : Shape

@end

@interface Square : Shape

@end

    
#import "Shape.h"

@implementation Shape

- (void)draw {
    NSLog(@"Shape draw");
}

@end

@implementation Square

- (void)draw {
    NSLog(@"Square draw");
}

@end


@implementation Circle

- (void)draw {
   NSLog(@"Circle draw");
}

@end


@implementation Rectangle

- (void)draw {
    NSLog(@"Rectangle draw");
}

@end
```



使用（选取想要创建的类工厂直接创建）

```objective-c
shape = [CircleFactory getShape];
[shape draw];
```



 **1. 主要优点**

​       (1) 外部使用不需要关心创建细节。

​       (2) 在添加新的产品时，不需要修改原有代码，只需新添加产品类以及产品工厂类，系统的可扩展性非常好，完全符合“开闭原则”。

 

 **2. 主要缺点**

​      (1) 在添加新产品时，需要编写新的具体产品类和对应的具体工厂类，系统中类的个数将成对增加。

 **3. 适用场景**

​      (1)不需要了解创建细节且产品种类较多，可能增添产品时使用。





#### 抽象工厂模式（Abstract  Factory Pattern）

假设我们有衣服和裤子两种产品，而每个产品又分别有几个品牌。即拥有：

品牌A： 衣服A   鞋子A

品牌B： 衣服B   鞋子B

品牌C： 衣服C   鞋子C

当我们需要使用衣服和裤子时，需要使用同一品牌，此时我们如果按照工厂模式，会有六个具体产品类，以及对应六个工厂类。

当我们使用抽象工厂模式时，可以创建对应品牌的工厂类，该工厂类负责创建同品牌的衣服以及裤子两种产品的创建。



产品基类以及产品类：

```objective-c
#import <Foundation/Foundation.h>

@interface Clothes : NSObject

- (void)show;

@end

@interface ClothesA : Clothes

@end

@interface ClothesB : Clothes

@end
    
#import "Clothes.h"

@implementation Clothes

- (void)show {
    NSLog(@"Clothes Show");
}

@end

@implementation ClothesA

- (void)show {
    NSLog(@"ClothesA Show");
}

@end

@implementation ClothesB

- (void)show {
    NSLog(@"ClothesB Show");
}

@end
    
    
// 产品2
    
#import <Foundation/Foundation.h>

@interface Shoes : NSObject

- (void)show;

@end

@interface ShoesA : Shoes

@end

@interface ShoesB : Shoes

@end

#import "Shoes.h"

@implementation Shoes

- (void)show {
    NSLog(@"Shoes Show");
}

@end

@implementation ShoesA

- (void)show {
    NSLog(@"ShoesA Show");
}

@end

@implementation ShoesB

- (void)show {
    NSLog(@"ShoesB Show");
}

@end
```



工厂类及基类：

```objective-c
@interface BrandFactory : NSObject

+ (Clothes *)createClothes;
+ (Shoes *)createShoes;

@end


@interface BrandFactoryA : BrandFactory

@end

@interface BrandFactoryB : BrandFactory

@end
    
#import "BrandFactory.h"

@implementation BrandFactory

+ (Clothes *)createClothes {
    return [[Clothes alloc] init];
}

+ (Shoes *)createShoes {
    return [[Shoes alloc] init];
}

@end

@implementation BrandFactoryA

+ (Clothes *)createClothes {
    return (Clothes *)[[ClothesA alloc] init];
};

+ (Shoes *)createShoes {
    return (Shoes *)[[ShoesA alloc] init];
};

@end

@implementation BrandFactoryB

+ (Clothes *)createClothes {
    return (Clothes *)[[ClothesB alloc] init];
};

+ (Shoes *)createShoes {
    return (Shoes *)[[ShoesB alloc] init];
};

@end
```

使用：

```objective-c
// 动态获取的类名
NSString *serverStr = @"BrandFactoryA";
Class cls = NSClassFromString(serverStr);
ClothesA *clothesA;
ShoesA *shoesA;
if ([cls respondsToSelector:@selector(createClothes)]) {
    clothesA = (ClothesA *)[cls performSelector:@selector(createClothes)];
}
if ([cls respondsToSelector:@selector(createShoes)]) {
    shoesA = (ShoesA *)[cls performSelector:@selector(createShoes)];
}
[clothesA show];
[shoesA show];
```

   **1. 主要优点**

​       (1) 只替换掉工厂类即可以替换掉一套产品类。

​       (2) 当一个产品族中的多个对象被设计成一起工作时，它能够保证客户端始终只使用同一个产品族中的对象。

​       (3) 增加新的产品族很方便，无须修改已有系统，符合“开闭原则”。

 

​       **2. 主要缺点**

​       增加新的产品等级结构麻烦，需要对原有系统进行较大的修改，甚至需要修改抽象层代码，违背了“开闭原则”。



​       **3. 适用场景**

​       (1) 一个系统不应当依赖于产品类实例如何被创建、组合和表达的细节，将对象的创建和使用解耦。

​       (2) 有很多产品族，而且必须使用同一族产品。

​       (3) 产品等级结构稳定，设计完成之后，不会向系统中增加新的产品等级结构或者删除已有的产品等级结构。



#### 单例模式（Singleton Pattern）

在整个程序中只存在一个对象，多次获取均为同一对象。

分类：

​	(1)饿汉式：单例类在加载时就创建静态变量。

​	(2)懒汉式：在获取单例时，一般是如果为静态变量为空则创建，所以此时如果多线程访问会出现问题，可能多次创建，所以要加锁。（iOS中，onceToken可以解决）

**1.主要优点**

​       (1) 单例模式提供了对唯一实例的受控访问。因为单例类封装了它的唯一实例，所以它可以严格控制客户怎样以及何时访问它。

​       (2) 节约系统资源。

 

**2.主要缺点**

​       (1) 由于单例模式中没有抽象层，因此单例类的扩展有很大的困难。

​       (2) 单例类的职责过重，在一定程度上违背了“单一职责原则”。

 

**3.适用场景**

​       (1) 系统只需要一个实例对象，如系统要求提供一个唯一的序列号生成器或资源管理器，或者需要考虑资源消耗太大而只允许创建一个对象。

​       (2) 客户调用类的单个实例只允许使用一个公共访问点，除了该公共访问点，不能通过其他途径访问该实例。



#### 原型模式（Prototype Pattern）      

快速创建大量相同或相似对象的方式，很多软件提供的复制(Ctrl + C)和粘贴(Ctrl + V)操作就是原型模式的典型应用，iOS中遵循NSCopying协议，实现协议方法完成复制即可。



原型类：（其中NSObject充当了抽象原型,提供了Copy方法）

```objective-c
#import <Foundation/Foundation.h>

@interface Shoes : NSObject<NSCopying>

@property (nonatomic, assign) NSInteger size;
@property (nonatomic, copy) NSString *brand;

@end
    
    
    
#import "Shoes.h"

@implementation Shoes

- (id)copyWithZone:(NSZone *)zone {
    Shoes *shoes = [[Shoes allocWithZone:zone] init];
    // 此处可以runtime获取所有成员变量KVC循环赋值
    shoes.brand = self.brand;
    shoes.size = self.size;
    return shoes;
}

@end
```

使用：

```objective-c
    Shoes *shoes1 = [[Shoes alloc] init];
    shoes1.size = 41;
    shoes1.brand = @"Nike";
    Shoes *shoes2 = [shoes1 copy];
    NSLog(@"%@", shoes2.brand);
```



**1.主要优点**

(1) 当创建新的对象实例较为复杂时，通过复制一个已有实例可以提高新实例的创建效率。

(2) 扩展性较好，由于在原型模式中提供了抽象原型类，在客户端可以针对抽象原型类进行编程，而将具体原型类写在配置文件中，增加或减少产品类对原有系统都没有任何影响。

(3) 原型模式提供了简化的创建结构，无须专门的工厂类来创建产品。

(4) 可以使用深克隆的方式保存对象的状态，使用原型模式将对象复制一份并将其状态保存起来，以便在需要的时候使用（如恢复到某一历史状态），可辅助实现撤销操作。

**2.主要缺点**

(1) 需要为每一个类配备一个克隆方法，而且该克隆方法位于一个类的内部，当对已有的类进行改造时，需要修改源代码，违背了“开闭原则”。

(2) 在实现深克隆时需要编写较为复杂的代码，而且当对象之间存在多重的嵌套引用时，为了实现深克隆，每一层对象对应的类都必须支持深克隆，实现起来可能会比较麻烦。

**3.适用场景**

(1) 创建新对象成本较大（如初始化需要占用较长的时间，占用太多的CPU资源或网络资源），新的对象可以通过原型模式对已有对象进行复制来获得，如果是相似对象，则可以对其成员变量稍作修改。

(2) 如果系统要保存对象的状态，而对象的状态变化很小，或者对象本身占用内存较少时，可以使用原型模式配合备忘录模式来实现。

(3) 需要避免使用分层次的工厂类来创建分层次的对象，通过复制原型对象得到新实例可能比使用构造函数创建一个新实例更加方便。



#### 建造者模式（Builder Pattern）

假设需要建造一辆车对象，车内部会有自动驾驶设备、轮子、发动机、方向盘等部件，而且部件见可能还有先后顺序依赖情况，此时我们使用建造者模式。



产品类：(简单起见这里的部件为String，其实可以为自定义的类)

```objective-c
#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, copy) NSString *SteeringWheel;
@property (nonatomic, copy) NSString *Wheel;
@property (nonatomic, copy) NSString *Engine;
@property (nonatomic, copy) NSString *AutoMachine;

@end
    

#import "Car.h"

@implementation Car

@end
```



抽象构建者类以及实际构建者类：

```objective-c
#import <Foundation/Foundation.h>
#import "Car.h"

@interface CarBuilder : NSObject

+ (Car *)BuildCar;

+ (void)BuildPartSteeringWheel:(Car *)car;
+ (void)BuildPartWheel:(Car *)car;
+ (void)BuildPartEngine:(Car *)car;
+ (void)BuildPartAutoMachine:(Car *)car;

@end

@interface BMWCarBuilder : CarBuilder

@end
    
    
#import "CarBuilder.h"

@implementation CarBuilder
+ (Car *)BuildCar {
    Car *car = [[Car alloc] init];
    [self BuildPartWheel:car];
    [self BuildPartEngine:car];
    [self BuildPartAutoMachine:car];
    [self BuildPartSteeringWheel:car];
    return car;
}

+ (void)BuildPartSteeringWheel:(Car *)car {
    car.SteeringWheel = @"生成方向盘";
}

+ (void)BuildPartWheel:(Car *)car {
    car.Wheel = @"生成轮子";
}

+ (void)BuildPartEngine:(Car *)car {
    car.Engine = @"生成发动机";
}

+ (void)BuildPartAutoMachine:(Car *)car {
    car.AutoMachine = @"生成自动驾驶设备";
}

@end

@implementation BMWCarBuilder

+ (Car *)BuildCar {
    Car *car = [[Car alloc] init];
    [self BuildPartWheel:car];
    [self BuildPartEngine:car];
    [self BuildPartAutoMachine:car];
    return car;
}

+ (void)BuildPartSteeringWheel:(Car *)car {
    car.SteeringWheel = @"生成BMW方向盘";
}

+ (void)BuildPartWheel:(Car *)car {
    car.Wheel = @"生成BMW轮子";
}

+ (void)BuildPartEngine:(Car *)car {
    car.Engine = @"生成BMW发动机";
}

+ (void)BuildPartAutoMachine:(Car *)car {
    car.AutoMachine = @"生成BMW自动驾驶设备";
}


@end

```



使用：

```objc
    Car *car = [BMWCarBuilder BuildCar];
    NSLog(@"%@", car.AutoMachine);
```



构建者模式首先有一个需要构建的产品类，然后生成抽象构建者类，以及实际构建者类。实际的构建者内部可以根据所需构建产品的不同，按不同的顺序以及不同的部件个数去生成产品。（例如：上述BMW汽车类因为包含自动驾驶部件，所以不需要添加方向盘部件）。



**1.主要优点**

(1) 客户端不必知道产品内部部件生成的细节，使得相同的创建过程可以创建不同的产品对象（使用不同实际构建者）。

(2) 新增具体产品，只需增加新的具体建造者无须修改原有类库的代码，系统扩展方便，符合“开闭原则”

**2.主要缺点**

(1) 产品间构成差距较大，不适合使用构建者模式。

(2) 如果产品的内部变化复杂，会需要很多实际构建者。

**3.适用场景**

(1) 需要生成的产品对象有复杂的内部结构，这些产品对象通常包含多个成员属性。

(2) 需要生成的产品对象的属性相互依赖，需要指定其生成顺序。





### 总结

简单工厂： 一个工厂类通过传入类型生产多个产品。

工厂模式：每个产品对应工厂类，使用对应工厂类生产产品。

抽象工厂：每个产品族对应一个工厂类，每个工厂类生产多个同一产品族的产品。

单例：整个程序只有一个实例。

原型：快速复制对象。

构建者：创建一个内部由多个构建的产品，可以控制不同类型产品的具体生产过程。