//
//  Person.m
//  runtimePractice
//
//  Created by Chen on 16/5/13.
//  Copyright © 2016年 ChenYingPing. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
#import "Cat.h"

@implementation Person

void aaa(id self,SEL _cmd,id param) {
    NSLog(@"狗吃东西吃了%@年",param);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
//    if (sel == @selector(eat:)) {
//        class_addMethod([self class], sel, (IMP)aaa, "v@:@");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

// 第二部：我们不指定备选对象响应aSelector，进入第三步；
- (id)forwardingTargetForSelector:(SEL)aSelector
{
//    return [[Cat alloc] init];
    return nil;
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature* signature = [super methodSignatureForSelector:selector];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];;
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //    Cat *cat = [[Cat alloc] init];
    //    if ([cat respondsToSelector: [anInvocation selector]])// 调用另外一个对象的这个方法
    //        [anInvocation invokeWithTarget:cat];
    //    else
    //        [super forwardInvocation:anInvocation];
    if ([self respondsToSelector:@selector(dance)]) { // 调用该对象的另一个方法
        [anInvocation setSelector:@selector(dance)];
        [anInvocation invokeWithTarget:self];
    } else
        [super forwardInvocation:anInvocation];
}

- (void)dance
{
    NSLog(@"狗在跳舞了，狗不想吃饭");
}
@end
