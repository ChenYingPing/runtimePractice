//
//  Model.h
//  runtimePractice
//
//  Created by Chen on 16/5/13.
//  Copyright © 2016年 ChenYingPing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *job;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
