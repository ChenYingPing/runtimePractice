//
//  Model.m
//  runtimePractice
//
//  Created by Chen on 16/5/13.
//  Copyright © 2016年 ChenYingPing. All rights reserved.
//

#import "Model.h"
#import <objc/message.h>

@implementation Model

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
//            fprintf(stdout, "%s ---- %s\n", property_getName(property), property_getAttributes(property));
            const char *propertyName = property_getName(property);
            NSString *name =  [NSString stringWithUTF8String:propertyName];
            id propertyValue = [dict valueForKey:name];
            if (propertyValue) {
                NSLog(propertyValue);
                NSString *propertySetterName = [NSString stringWithFormat:@"set%@:", name.capitalizedString];
                SEL setter = NSSelectorFromString(propertySetterName);
                  if ([self respondsToSelector:setter]) {
                      ((void (*)(id, SEL, id))objc_msgSend)(self, setter, propertyValue);
                  }
            } else {
                
            }
        }
    }
    return self;
}

//  category中添加属性只会声明get、set方面，并不会默认实现。所以我们可以使用下面的方法给category动态添加属性
//- (void)setName:(NSString *)name
//{
//    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//- (NSString *)name
//{
//    return objc_getAssociatedObject(self, @"name");
//}

@end
