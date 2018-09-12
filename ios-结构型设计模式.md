#### 适配器模式（Adapter Pattern）

通过增加一个新的适配器类来解决接口不兼容的问题，不修改原有代码把原有接口包装成特定需要的接口。

​       ● **Target（目标抽象类）：**目标抽象类定义客户所需接口，可以是一个抽象类或接口，也可以是具体类。

​       ● **Adapter（适配器类）：**适配器可以调用另一个接口，作为一个转换器，对Adaptee和Target进行适配，适配器类是适配器模式的核心，在对象适配器中，它通过继承Target并关联一个Adaptee对象使二者产生联系。(也可以继承原有类实现适配)

​       ● **Adaptee** **（适配者类）**：被适配的角色，它定义了一个已经存在的接口，这个接口需要适配，适配者类一般是一个具体类，包含了客户希望使用的业务方法。



目标抽象：(可以根据实际情况定义必须实现以及可选实现的协议方法，从而实现缺省适配模式,在具体适配器中只适配一部分方法)

```objective-c
@protocol AdapterProtocol
@required
- (void)useLib1Func;
@optional
- (void)useLib2Func;
@end
```



原有类：

```objective-c
@interface Library : NSObject

- (void)libraryFunc;

@end

@interface Library2 : NSObject

- (void)library2Func;

@end
    
@implementation Library

- (void)libraryFunc {
    NSLog(@"libraryFunc");
}

@end

@implementation Library2

- (void)library2Func {
    NSLog(@"library2Func");
}

@end

```



适配器类：

```objective-c
#import <Foundation/Foundation.h>
#import "Library.h"

@interface Adapter : NSObject<AdapterProtocol>

@end
    
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

- (void)useLib2Func {
    [_lib2 library2Func];
}

@end
```

使用：

```objective-c
Adapter *ad = [[Adapter alloc] init];
[ad useLib1Func];
[ad useLib2Func];
```



 **1. 主要优点**

​       (1) **将目标类和适配者类解耦**，通过引入一个适配器类来重用现有的适配者类，无须修改原有结构。

​       (2) **增加了类的透明性和复用性**，将具体的业务实现过程封装在适配者类中，对于客户端类而言是透明的，而且提高了适配者的复用性，同一个适配者类可以在多个不同的系统中复用。

​       (3) **灵活性和扩展性都非常好**，通过使用配置文件，可以很方便地更换适配器，也可以在不修改原有代码的基础上增加新的适配器类，完全符合“开闭原则”。

​      对象适配器模式还有如下优点：

​      (1) 一个对象适配器**可以把多个不同的适配者适配到同一个目标**；

​      (2) **可以适配一个适配者的子类**，由于适配器和适配者之间是关联关系，根据“里氏代换原则”，适配者的子类也可通过该适配器进行适配。

​      **2. 主要缺点**

​      与类适配器模式相比，**要在适配器中置换适配者类的某些方法比较麻烦**。如果一定要置换掉适配者类的一个或多个方法，可以先做一个适配者类的子类，将适配者类的方法置换掉，然后再把适配者类的子类当做真正的适配者进行适配，实现过程较为复杂。

​      **3. 适用场景**

​       (1) 系统需要使用一些现有的类，而这些类的接口（如方法名）不符合系统的需要，甚至没有这些类的源代码。

​       (2) 想创建一个可以重复使用的类，用于与一些彼此之间没有太大关联的一些类，包括一些可能在将来引进的类一起工作。



#### 桥接模式（Bridge Pattern）

某个类存在两个独立变化的维度，通过该模式可以将这两个维度分离出来，使两者可以独立扩展，让系统更加符合“单一职责原则”。

比如：各种不同品牌的车在不同的路上行驶。如果采用多层继承的模式，首先需要有一个汽车的抽象类，然后产生多个不同品牌的汽车类，最后每个汽车都需要有各种路况下的子类，这个方案明显不好，我们使用桥接模式：

首先根据需求，把类抽取出两个变化的维度，分别为汽车 和 路况。

我们生成一个汽车的抽象类，然后生成多个对应品牌的汽车实际类，

还需要一个路况的抽象协议，以及对应路况类。



抽象协议：

```objective-c
@protocol Drive
- (void)Drive:(NSString *)price;
@end
```

协议的实现类（路况：

```objective-c
@interface Road : NSObject<Drive>

@end

@interface FreeWay : NSObject<Drive>

@end

    
#import "Road.h"

@implementation Road

- (void)Drive:(NSString *)price {
    NSLog(@"%@ drive on road", price);
}

@end

@implementation FreeWay

- (void)Drive:(NSString *)price {
    NSLog(@"%@ drive on FreeWay", price);
}

@end
```



抽象汽车类：(所谓桥接就是发生在抽象汽车类，内部拥有路况类，从而构建出不同的情况)

```objective-c
#import <Foundation/Foundation.h>
#import "Road.h"

@interface Car : NSObject

@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, strong) id<Drive> RoadCondition;

- (void)running;

@end
    
#import "Car.h"

@implementation Car

- (void)running {}

@end
```

实际汽车类：

```objective-c

@interface BMWCar : Car


@end

@interface FORDCar : Car

@end
    

@implementation BMWCar

- (instancetype)init {
    if (self = [super init]) {
        self.typeName = @"BMW";
    }
    return self;
}

- (void)running {
    [self.RoadCondition Drive:self.typeName];
}

@end

@implementation FORDCar

- (instancetype)init {
    if (self = [super init]) {
        self.typeName = @"FORD";
    }
    return self;
}

- (void)running {
    [self.RoadCondition Drive:self.typeName];
}

@end
```

使用：

```objective-c
    BMWCar *car = [[BMWCar alloc] init];
    FreeWay *fw = [[FreeWay alloc] init];
    [car setRoadCondition:fw];
    [car running];
```

**1.主要优点**

​        (1)分离抽象接口及其实现部分。桥接模式使用“对象间的关联关系”解耦了抽象和实现之间固有的绑定关系，使得抽象和实现可以沿着各自的维度来变化。

​        (2)桥接模式提高了系统的可扩展性，在两个变化维度中任意扩展一个维度，都不需要修改原有系统，符合“开闭原则”。

**2.主要缺点**

​        (1)桥接模式的使用会增加系统的理解与设计难度，由于关联关系建立在抽象层，要求开发者一开始就针对抽象层进行设计与编程。

**3.适用场景**

​        (1)一个类存在两个（或多个）独立变化的维度，且这两个（或多个）维度都需要独立进行扩展。

​        (2)不希望使用继承或因为多层继承导致系统类的个数急剧增加的系统。



#### 组合模式（Composite Pattern）

当我们的软件中存在树形结构时，即类似文件夹结构中，文件夹内可能有文件夹与文件。这种情况下通常会使用组合模式。iOS中典型应用`UIView`

 **● Component（抽象构件）：**它可以是接口或抽象类，为叶子构件和容器构件对象声明接口，在该角色中可以包含所有子类共有行为的声明和实现。在抽象构件中定义了访问及管理它的子构件的方法，如增加子构件、删除子构件、获取子构件等。

 **● Leaf（叶子构件）：**它在组合结构中表示叶子节点对象，叶子节点没有子节点，它实现了在抽象构件中定义的行为。

 **● Composite（容器构件）：**它在组合结构中表示容器节点对象，容器节点包含子节点，其子节点可以是叶子节点，也可以是容器节点，它提供一个集合用于存储子节点，实现了在抽象构件中定义的行为，包括那些访问及管理子构件的方法，在其业务方法中可以递归调用其子节点的业务方法。



抽象构件以及实际构件：

```objective-c
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
```

使用：

```objective-c
    // 统一使用抽象类型，可以在使用时不区分类型
	ComponentAbstruct *leaf1 = [[Leaf alloc] init];
    ComponentAbstruct *leaf2 = [[Leaf alloc] init];
    ComponentAbstruct *leaf3 = [[Leaf alloc] init];
    ComponentAbstruct *composite1 = [[Composite alloc] init];
    ComponentAbstruct *composite2 = [[Composite alloc] init];

    [composite1 addComponent:composite2];
    [composite1 addComponent:leaf1];
    [composite1 addComponent:leaf2];

    [composite2 addComponent:leaf3];

    [composite1 showInformation];
```



**1. 主要优点**

​      (1) 客户端可以一致地使用一个组合结构或其中单个对象，不必关心处理的是单个对象还是整个组合结构，简化了客户端代码。

​      (2) 在组合模式中增加新的容器构件和叶子构件都很方便，无须对现有类库进行任何修改，符合“开闭原则”。

​      (3) 组合模式为树形结构的面向对象实现提供了一种灵活的解决方案，通过叶子对象和容器对象的递归组合，可以形成复杂的树形结构，但对树形结构的控制却非常简单。

​      **2. 主要缺点**

​	有时候我们希望一个容器中只能有某些特定类型的对象，例如在某个文件夹中只能包含文本文件，使用组合模式时，不能依赖类型系统来施加这些约束，因为它们都来自于相同的抽象层，在这种情况下，必须通过在运行时进行类型检查来实现，这个实现过程较为复杂。

​      **3. 适用场景**

​      (1) 在具有整体和部分的层次结构中，希望通过一种方式忽略整体与部分的差异，客户端可以一致地对待它们。

​      (2) 在一个使用面向对象语言开发的系统中需要处理一个树形结构。

​      (3) 在一个系统中能够分离出叶子对象和容器对象，而且它们的类型不固定，需要增加一些新的类型。



#### 装饰模式（Decorator Pattern）

装饰模式可以在不改变一个对象本身功能的基础上给对象增加额外的新行为。

ios中分类很好的实现了装饰模式。

```objective-c
@interface YSraw : NSObject

- (void)find;

@end

@implementation YSraw

- (void)find {
    NSLog(@"原有find");
}

@end

```

分类:

```objective-c
@interface YSraw (Ct)

- (void)find;

- (void)externFind;

@end
    
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
```

**1.主要优点**

(1) 对于扩展一个对象的功能，装饰模式比继承更加灵活性，不会导致类的个数急剧增加。

(2) 可以通过一种动态的方式来扩展一个对象的功能，通过配置文件可以在运行时选择不同的具体装饰类，从而实现不同的行为。

(3) 具体构件类与具体装饰类可以独立变化，用户可以根据需要增加新的具体构件类和具体装饰类，原有类库代码无须改变，符合“开闭原则”。

**2.主要缺点**

(1) 使用装饰模式进行系统设计时将产生很多小对象，这些对象的区别在于它们之间相互连接的方式有所不同，而不是它们的类或者属性值有所不同，大量小对象的产生势必会占用更多的系统资源，在一定程序上影响程序的性能。

**3.适用场景**

(1) 在不影响其他对象的情况下，以动态、透明的方式给单个对象添加职责。



#### 外观模式（Facade Pattern）

通过一个外观类，把复杂的子系统内部的很多对象分隔开。外观类内部引用需要使用的子系统，客户端只需要依赖外观类即可。

​      **(1) Facade（外观角色）：**在客户端可以调用它的方法，在外观角色中可以知道相关的（一个或者多个）子系统的功能和责任；在正常情况下，它将所有从客户端发来的请求委派到相应的子系统去，传递给相应的子系统对象处理。

​      **(2) SubSystem（子系统角色）：**在软件系统中可以有一个或者多个子系统角色，每一个子系统可以不是一个单独的类，而是一个类的集合，它实现子系统的功能；每一个子系统都可以被客户端直接调用，或者被外观角色调用，它处理由外观类传过来的请求。



外观类：

```objective-c
@interface Fade : NSObject

- (NSString *)DoComplexWork:(NSString *)material;

@end
    
#import "Fade.h"
#import "SubSystem.h"

@implementation Fade

- (NSString *)DoComplexWork:(NSString *)material {
    NSString *result = [SubSystem doWork:material];
    result = [SubSystem1 doWork1:result];
    return [SubSystem2 doWork2:result];
}

@end
```



子系统：

```objective-c
@interface SubSystem : NSObject

+ (NSString *)doWork:(NSString *)material;

@end

@interface SubSystem1 : NSObject
+ (NSString *)doWork1:(NSString *)material;
@end

@interface SubSystem2 : NSObject
+ (NSString *)doWork2:(NSString *)material;
@end
    


#import "SubSystem.h"

@implementation SubSystem

+ (NSString *)doWork:(NSString *)material {
    return [material stringByAppendingString:@"  doWork"];
}

@end

@implementation SubSystem1

+ (NSString *)doWork1:(NSString *)material {
    return [material stringByAppendingString:@"  doWork1"];
}

@end


@implementation SubSystem2

+ (NSString *)doWork2:(NSString *)material {
    return [material stringByAppendingString:@"  doWork2"];
}

@end
```



**1.主要优点**

​       (1) 它对客户端屏蔽了子系统组件，减少了客户端所需处理的对象数目，并使得子系统使用起来更加容易。通过引入外观模式，客户端代码将变得很简单，与之关联的对象也很少。

​       (2) 它实现了子系统与客户端之间的松耦合关系，这使得子系统的变化不会影响到调用它的客户端，只需要调整外观类即可。

​       (3) 一个子系统的修改对其他子系统没有任何影响，而且子系统内部变化也不会影响到外观对象。

 **2.主要缺点**

​       (1) 客户端不能详细控制子系统的使用情况。



**3.适用场景 **

​       (1) 当要为访问一系列复杂的子系统提供一个简单入口时可以使用外观模式。

​       (2) 客户端程序与多个子系统之间存在很大的依赖性。引入外观类可以将子系统与客户端解耦，从而提高子系统的独立性和可移植性。

​       (3) 在层次化结构中，可以使用外观模式定义系统中每一层的入口，层与层之间不直接产生联系，而通过外观类建立联系，降低层之间的耦合度。



#### 代理模式（Proxy Pattern）

当一个类内部发生某些状态需要通知给别的类时，可以使用代理。

被代理类：

```objective-c
#import <Foundation/Foundation.h>

@protocol BuyerDelete<NSObject>
@required
- (void)buyGoods;

@end

@interface Custom : NSObject

@property (nonatomic, weak) id<BuyerDelete> delegate;

- (void)wantAGood;

@end
    
#import "Custom.h"

@implementation Custom

- (void)wantAGood {
    NSLog(@"想要一个商品");

    if ([self.delegate respondsToSelector:@selector(buyGoods)]) {
        [self.delegate buyGoods];
    }
}

@end
```

代理类：（遵守协议，实现协议方法即可）

```objective-c
@interface BuyerClass : NSObject<BuyerDelete>

@end

#import "BuyerClass.h"

@implementation BuyerClass

- (void)buyGoods {
    NSLog(@"代理人在买东西");
}

@end
```

使用:

```objective-c
    BuyerClass *by = [[BuyerClass alloc] init];
    Custom *cs = [[Custom alloc] init];
    cs.delegate = by;
    [cs wantAGood];
```





#### 享元模式（Flyweight Pattern）

通过共享技术实现相同或相似对象的重用，存储共享示例的地方称为享元池。(iOS中的tableviewcell使用了该模式，`但是共享的享元不止一个`)

享元能够做到重用需要区分内部状态和外部状态，内部状态存储在对象内部不会改变，外部状态存储在对象外部随着环境而改变。

假设我们需要创建围棋中的棋子，棋子分为白棋和黑棋两种，且每个棋子都有在棋盘上的坐标。

享元抽象以及享元类：

```objective-c
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ChessmanType) {
    ChessmanTypeWhite,
    ChessmanTypeBlack
};

@interface IgoChessman : NSObject

@property (nonatomic, copy) NSString *position;
- (void)display:(NSString *)position;

@end

@interface IgoChessmanBlack : IgoChessman


@end

@interface IgoChessmanWhite : IgoChessman


@end

#import "IgoChessman.h"

@interface IgoChessman ()
@property (nonatomic, copy) NSString *name;
@end

@implementation IgoChessman

- (void)display:(NSString *)position {
    NSLog(@"%@ 位置：%@", self.name, position);
}

@end

@implementation IgoChessmanBlack

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"IgoChessmanBlack";
    }
    return self;
}

@end

@implementation IgoChessmanWhite

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"IgoChessmanWhite";
    }
    return self;
}

@end
```



单例的工厂类：

```objc

#import <Foundation/Foundation.h>
#import "IgoChessman.h"

@interface ChessmanFactory : NSObject

+ (instancetype)shareInstance;

- (IgoChessman *)getChessman:(ChessmanType)type;

@end


#import "ChessmanFactory.h"

@implementation ChessmanFactory
{
    NSMutableDictionary *pool_;
}
static ChessmanFactory *instance_;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[ChessmanFactory alloc] init];
    });
    return instance_;
}

- (instancetype)init {
    if (self = [super init]) {
        pool_ = [NSMutableDictionary dictionary];
    }
    return self;
}

- (IgoChessman *)getChessman:(ChessmanType)type {
    IgoChessman *chessman = [pool_ valueForKey:[NSString stringWithFormat:@"%zd", type]];
    if (!chessman) {
        if (type == ChessmanTypeBlack) {
            chessman = [[IgoChessmanBlack alloc] init];
        } else {
            chessman = [[IgoChessmanWhite alloc] init];
        }
        [pool_ setValue:chessman forKey:[NSString stringWithFormat:@"%zd", type]];
    }
    return chessman;
}

@end
```

 **1.主要优点**

​       (1) 可以极大减少内存中对象的数量，使得相同或相似对象在内存中只保存一份，从而可以节约系统资源，提高系统性能。

​       (2) 享元模式的外部状态相对独立，而且不会影响其内部状态，从而使得享元对象可以在不同的环境中被共享。

​       **2.主要缺点**

​       (1) 享元模式使得系统变得复杂，需要分离出内部状态和外部状态，这使得程序的逻辑复杂化。

​       **3.适用场景**

​       (1) 一个系统有大量相同或者相似的对象，造成内存的大量耗费。

​       (2) 对象的大部分状态都可以外部化，可以将这些外部状态传入对象中。

​       (3) 在使用享元模式时需要维护一个存储享元对象的享元池，而这需要耗费一定的系统资源，因此，应当在需要多次重复使用享元对象时才值得使用享元模式。

