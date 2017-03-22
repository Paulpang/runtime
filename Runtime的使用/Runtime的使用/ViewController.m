//
//  ViewController.m
//  Runtime的使用
//
//  Created by Paul on 2016/9/20.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.获取Person中所有的方法名称
    unsigned int couont = 0;
    /*
     第一个参数, 需要获取的类
     第二个参数, 获取到的个数
     */
    
    Method *methods = class_copyMethodList([Person class], &couont);
    for (int i = 0; i < couont; i++) {
        // 1.获取遍历到得方法名称
        SEL m = method_getName(methods[i]);
        // 2.将方法名称转换为字符串
        NSString *methodName = NSStringFromSelector(m);
        // 3.输出
        NSLog(@"%@", methodName);
    }
    
    // 2. 获取对象的私有成员变量
    
    Ivar *var = class_copyIvarList([Person class], &couont);
    for (int i = 0; i < couont; i++) {
        // 1.获取遍历到得成员变量名称
        const char *varName = ivar_getName(var[i]);
        // 2.将变量名称转换为字符串
        NSString *name = [NSString stringWithUTF8String:varName];
        // 3.输出
        NSLog(@"%@", name);
    }
    
    
    // 3. 获取对象的私有属性
    objc_property_t *propertes = class_copyPropertyList([Person class], &couont);
    for (int i = 0; i < couont; i++) {
        // 1.获取遍历到得属性名称
        const char * propertyName =  property_getName(propertes[i]);
        // 2.将属性名称转换为字符串
        NSString *name = [NSString stringWithUTF8String:propertyName];
        // 3.输出
        NSLog(@"%@", name);
    }
    
    // 将数据保存到本地
     Person *p = [[Person alloc] init];
     p.score = 99.8;
     p.className = @"xxxx";
     p.picUrls = @[@"123", @"456"];
     [NSKeyedArchiver archiveRootObject:p toFile:@"/Users/Paul/Desktop"];
    
    // 从本地读取数据
//    Person *p =  [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/Paul/Desktop/"];
//    NSLog(@"%@", p);
    
}



@end
