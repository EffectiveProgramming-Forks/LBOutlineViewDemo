//
//  LBSimpleItem.h
//  LBOutlineViewDemo
//
//  Created by Luther Baker on 11/4/14.
//  Copyright (c) 2014 Luther Baker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBSimpleItem : NSObject

+ (instancetype)itemWithTitle:(NSString *)title;

@property (nonatomic) NSString *title;

@end
