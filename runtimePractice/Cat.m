//
//  Cat.m
//  runtimePractice
//
//  Created by Chen on 16/5/13.
//  Copyright © 2016年 ChenYingPing. All rights reserved.
//

#import "Cat.h"
#import <objc/message.h>

@implementation Cat

void cat(id self,SEL _cmd,id param) {
    NSLog(@"🐱吃东西吃了%@年",param);
}

- (void)eat:(NSString *)param
{
    NSLog(@"狗让我吃%@年的饭",param);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat:)) {
        class_addMethod([self class], sel, (IMP)cat, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}


@end
