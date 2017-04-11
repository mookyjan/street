//
//  UIImage+helper.m
//  SampleProject
//
//  Created by Tahir Iqbal on 11/12/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//

#import "UIImage+helper.h"

@implementation UIImage (helper)

- (UIImage *)getImageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [string drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
