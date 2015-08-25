# ShuttleNavigationController
A navigation controller can use custom animation to go back and go forward just like safri behaved,it also can take a complete block.

http://bibibi.me/NavigationAnimation/

##### Features

- it can go foward.
- it can use custom animations.
- when the animation end,it calls a block.

##### How to use it

- replace UINavigationController with HJNC.

```
ViewController *vc = [[ViewController alloc] init];

HJNC *rootNC = [[HJNC alloc] initWithRootViewController:vc enableInteractivePush:YES];

self.window.rootViewController = rootNC;
```

- implement the protocol

```
@interface BaseViewController : UIViewController <HJVCInCDelegate>

@end
```

```
@implementation BaseViewController
@synthesize
    canDragBack,
    animationName;

- (BOOL)canDragBack
{
    return YES;
}

- (BOOL)canDragPush
{
    return YES;
}

- (NSString *)animationName
{
    return @"HJVCNormalAnimation";
}

@end
```

##### How to install it

now it only can be installed manually.