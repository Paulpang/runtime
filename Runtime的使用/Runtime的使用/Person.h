//
//  Person.h
//  Runtime的使用
//
//  Created by Paul on 2016/9/20.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSArray *picUrls;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, assign) float score;

@property (nonatomic, strong) NSNumber *number;

- (void)demo;
@end
