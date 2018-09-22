#### 职责链模式（Chain of Responsibility Pattern）

将多个对象连成一条链，给链上的一个对象发送请求，请求会沿着链进行传递，直到有对象处理或链结束。iOS中的事件响应链使用了该模式。

假设我们有 猫 狗 兔子三个类，分别吃 鱼 骨头 和 萝卜：

动物抽象类以及实际类：

```objective-c
#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, strong) Animal *nextAnimal;

- (void)eat:(NSString *)food;

@end

@interface Cat : Animal

@end

@interface Dog : Animal

@end

@interface Rabbit : Animal

@end
  
    
#import "Animal.h"

@implementation Animal

- (void)eat:(NSString *)food {}

@end

@implementation Cat

- (void)eat:(NSString *)food {
    if ([food isEqualToString:@"鱼"]) {
        NSLog(@"猫吃了鱼");
    } else {
        [self.nextAnimal eat:food];
    }
}

@end

@implementation Dog

- (void)eat:(NSString *)food {
    if ([food isEqualToString:@"骨头"]) {
        NSLog(@"狗吃了骨头");
    } else {
        [self.nextAnimal eat:food];
    }
}

@end

@implementation Rabbit

- (void)eat:(NSString *)food {
    if ([food isEqualToString:@"萝卜"]) {
        NSLog(@"兔子吃了萝卜");
    } else {
        [self.nextAnimal eat:food];
    }
}

@end
```

使用:

```objective-c
    Animal *cat = [[Cat alloc] init];
    Animal *dog = [[Dog alloc] init];
    Animal *rabbit = [[Rabbit alloc] init];

    cat.nextAnimal = dog;
    dog.nextAnimal = rabbit;

    [cat eat:@"骨头"];
```

**1.主要优点**

​       (1) 动态修改每个类的处理方法，可以实现不同的处理与传递的效果。

​       (2) 在系统中增加一个新的具体请求处理者时无须修改原有系统的代码，只需要在客户端重新建链即可，从这一点来看是符合“开闭原则”的。

​      

​       **2.主要缺点**

​       (1) 客户端创建链条较为繁琐。

 

​       **3.适用场景**

​       (1) 有多个对象可以处理同一个请求，具体哪个对象处理该请求待运行时刻再确定，客户端只需将请求提交到链上，而无须关心请求的处理对象是谁以及它是如何处理的。

​       (2) 在不明确指定接收者的情况下，向多个对象中的一个提交一个请求。

​       (3) 可动态指定一组对象处理请求，客户端可以动态创建职责链来处理请求，还可以改变链中处理者之间的先后次序。 



#### 命令模式（Command Pattern）

当我们需要向某个对象发送一个消息时，我们分别把发送该消息的对象称为发送者，接收这个消息的称为接收者。一般情况下我们需要直接在发送者中引用接收者，而我们可以使用命令模式解耦。在发送者中有一个抽象的命令引用，然后具体的命令类中会有对应接收者的引用，从而把消息发送给接收者。

接收者：

```objective-c
#import <Foundation/Foundation.h>

@interface Receiver1 : NSObject

- (void)handleTheMessage;

@end

@interface Receiver2 : NSObject

- (void)handleTheMessage;

@end
    
#import "Receiver.h"

@implementation Receiver1

- (void)handleTheMessage {
    NSLog(@"receiver1 handle the message!");
}

@end


@implementation Receiver2

- (void)handleTheMessage {
    NSLog(@"receiver2 handle the message!");
}

@end
```

抽象命令类以及实际命令类：实际命令类中有接收者引用

```objective-c
#import <Foundation/Foundation.h>
#import "Receiver.h"

@interface Command : NSObject

- (void)execute;

@end


@interface CommandReceiver1 : Command

@property (nonatomic, strong) Receiver1 *rec;

@end


@interface CommandReceiver2 : Command

@property (nonatomic, strong) Receiver2 *rec;

@end
    
#import "Command.h"

@implementation Command

- (void)execute {}

@end


@implementation CommandReceiver1

- (instancetype)init {
    if (self = [super init]) {
        self.rec = [[Receiver1 alloc] init];
    }
    return self;
}

- (void)execute {
    [self.rec handleTheMessage];
}

@end


@implementation CommandReceiver2

- (instancetype)init {
    if (self = [super init]) {
        self.rec = [[Receiver2 alloc] init];
    }
    return self;
}

- (void)execute {
    [self.rec handleTheMessage];
}

@end
```

调用者：

```objective-c
#import <Foundation/Foundation.h>
#import "Command.h"

@interface Invoker : NSObject

@property (nonatomic, strong) Command *com;

- (void)invoker;

@end

    
#import "Invoker.h"

@implementation Invoker

- (void)invoker {
    [self.com execute];
}

@end

```

使用: 通过修改调用者的命令类改变接收对象

```objective-c
Invoker *invo = [[Invoker alloc] init];
Command *com = [[CommandReceiver1 alloc] init];
invo.com = com;
[invo invoker];

invo.com = [[CommandReceiver2 alloc] init];
[invo invoker];
```



我们还可以把命令模式和组合模式结合起来，在命令类中使用组合模式，实际命令类中可以包含其他命令类，从而实现发消息给多个接收者。



​       **1. 主要优点**

​       (1) **降低系统的耦合度**。由于请求者与接收者之间不存在直接引用，因此请求者与接收者之间实现完全解耦，相同的请求者可以对应不同的接收者，同样，相同的接收者也可以供不同的请求者使用，两者之间具有良好的独立性。

​       (2) **新的命令可以很容易地加入到系统中**。由于增加新的具体命令类不会影响到其他类，因此增加新的具体命令类很容易，无须修改原有系统源代码，甚至客户类代码，满足“开闭原则”的要求。

​       (3) **可以比较容易地设计一个命令队列或宏命令（组合命令）**。

​       (4) **为请求的撤销(Undo)和恢复(Redo)操作提供了一种设计和实现方案**。（在命令类中添加控制代码）

 

​       **2. 主要缺点**

​       **使用命令模式可能会导致某些系统有过多的具体命令类**。因为针对每一个对请求接收者的调用操作都需要设计一个具体命令类，因此在某些系统中可能需要提供大量的具体命令类，这将影响命令模式的使用。

 

​       **3. 适用场景**

​       (1) 系统需要将请求调用者和请求接收者解耦，使得调用者和接收者不直接交互。请求调用者无须知道接收者的存在，也无须知道接收者是谁，接收者也无须关心何时被调用。

​       (2) 系统需要在不同的时间指定请求、将请求排队和执行请求。一个命令对象和请求的初始调用者可以有不同的生命期，换言之，最初的请求发出者可能已经不在了，而命令对象本身仍然是活动的，可以通过该命令对象去调用请求接收者，而无须关心请求调用者的存在性，可以通过请求日志文件等机制来具体实现。

​       (3) 系统需要支持命令的撤销(Undo)操作和恢复(Redo)操作。

​       (4) 系统需要将一组操作组合在一起形成宏命令。





#### 迭代器模式（Iterator Pattern）

经常我们的对象中会包含多个对象，例如NSArray对象中会包含多个对象，此时我们通常会运用迭代器模式把存储这些对象和遍历这些对象的功能分开。从而不需要知道存储对象的具体细节也能按需求获得内部对象。





#### 中介者模式（Mediator Pattern）

当多个类互相引用时，可以创建一个中介对象，每个类都引用中介对象且中介对象中包含各个类，从而在类中不需要包含其他各个类。





#### 观察者模式（Observer Pattern）





#### 策略模式（Strategy Pattern）

