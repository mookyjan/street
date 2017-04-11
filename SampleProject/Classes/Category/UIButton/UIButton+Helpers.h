//
//  UIButton+Helpers.h
//  SampleProject
//
//  Created by Zeeshan Haider on 11/11/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)();

@interface UIButton (Helpers)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
