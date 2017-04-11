//
//  UIImageView+Helper.m
//   SampleProject
//
//  Created by MacPro on 16/07/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//

#import "UIImageView+Helper.h"

@implementation UIImageView (Helper)
- (UIImage *) imageWithImageView
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0f);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage * snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}
@end
