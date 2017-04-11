//
//  UINavigationController+CustomCategory.m
//   SampleProject
//
//  Created by MacPro on 16/07/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (CustomCategory) <UIGestureRecognizerDelegate>

-(void)showDropMenu:(UIView *)menu animated:(BOOL)animated;

-(void)hideDroppedMenuAnimated:(BOOL)animated;

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;
@end
