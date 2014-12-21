//
//  BSSectionView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSStructurePath.h"

@interface BSDrawSectionView : UIView

@property (nonatomic, strong) CALayer   *backgroundLayer;
@property (nonatomic, strong) CALayer   *pathLayer;
@property (nonatomic, assign) NSInteger currentSectionNumber;

- (void)setNewSectionNumber:(NSInteger)num;
- (void)drawPaths:(NSMutableArray *)inputPaths;

@end
