//
//  BSSectionView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSStructurePath.h"

@interface BSSectionView : UIView

@property (nonatomic, strong)   CALayer *backgroundLayer;
@property (nonatomic, strong)   CALayer *pathLayer;
@property (nonatomic, strong)   CALayer *selectionLayer;
@property (nonatomic, strong)   CALayer *arteryLayer;
@property (assign)              NSInteger sxnNumber;
@property (assign)              bool isRotated;

- (id)      initWithFrame:(CGRect)frame andSectionNumber:(int) num;
- (BOOL)    isPoint:(CGPoint)point inPath:(BSStructurePath*) path;
- (void)    highlightPath:(BSStructurePath *) path;
- (void)    setNewSectionNumber:(NSInteger)num;

- (void)    drawPathsForProfile:(NSMutableArray *)inputPaths;
- (void)    fade;
- (void)    unfade;
- (void)    clearPaths;
- (void)    hidePathsToggle;
- (void)    rotateView;
- (void)    rotateViewRight;
- (void)    rotateViewLeft;
- (void)    arteryImageNamed:(NSString *)imageName;

+ (CGRect)  getFrameForSection:(NSInteger)num;
+ (CGPoint) getCenterForSection:(NSInteger)num;
+ (CGRect)  getFrameForClinicalSection;

@end
