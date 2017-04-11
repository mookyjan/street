//
//  UIButton+Helpers.m
//  SampleProject
//
//  Created by Zeeshan Haider on 11/11/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//

#import "UIButton+Helpers.h"
#import <objc/runtime.h>

static char overviewKey;

@implementation UIButton (Helpers)

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}
@end