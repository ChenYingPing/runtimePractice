//
//  ViewController.m
//  runtimePractice
//
//  Created by Chen on 16/5/13.
//  Copyright © 2016年 ChenYingPing. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UIViewController+Swizz.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(eat:) withObject:@"100"];
    
    NSDictionary *dict = @{@"name":@"chenyingp", @"age":@"14", @"job":@"iOS"};
    Model *model = [[Model alloc] initWithDictionary:dict];
//    model.name = @"hahahah";
    NSLog(@"name:%@  age:%@  job:%@",model.name,model.age,model.job);
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"我原来做了很多事情");
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
