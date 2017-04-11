//
//  UICollectionView+Helper.h
//  SampleProject
//
//  Created by Zeeshan Haider on 12/11/2015.
//  Copyright © 2015 DevBatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Helper)
- (void)registerCellsWithClasses:(NSArray *)classes;

- (void)registerNibWithClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind;
@end
