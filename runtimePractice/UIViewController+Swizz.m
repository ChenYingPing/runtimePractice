//
//  UIViewController+Swizz.m
//  runtimePractice
//
//  Created by Chen on 16/5/13.
//  Copyright © 2016年 ChenYingPing. All rights reserved.
//

#import "UIViewController+Swizz.h"
#import <objc/message.h>

@implementation UIViewController (Swizz)

+ (void)load
{
    Method swizzMethod = class_getInstanceMethod([self class], @selector(MY_viewWillAppear:));
    Method systemMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    method_exchangeImplementations(swizzMethod, systemMethod);
//    BOOL isAdd = class_addMethod([self class], @selector(viewWillAppear:), method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
//    if (isAdd) {
//        class_replaceMethod(self, @selector(MY_viewWillAppear:), method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
//    } else {
//        method_exchangeImplementations(swizzMethod, systemMethod);
//    }
}

- (void)MY_viewWillAppear:(BOOL)animated
{
    NSLog(@"在所有的这里面做一些统一的事情,比如友盟统计需要添加的一些东西");
    [self MY_viewWillAppear:animated];
    
}
@end
