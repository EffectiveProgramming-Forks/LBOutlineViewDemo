//
//  LBSimpleItem.m
//  LBOutlineViewDemo
//
//  Created by Luther Baker on 11/4/14.
//  Copyright (c) 2014 Luther Baker. All rights reserved.
//

#import "LBSimpleItem.h"

@implementation LBSimpleItem

+ (instancetype)itemWithTitle:(NSString *)title {
    LBSimpleItem *item = [[LBSimpleItem alloc] init];
    item.title = title;
    return item;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{ title: '%@' }", self.title];
}
@end
