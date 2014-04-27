//
//  BSAtlasSectionView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSSection.h"
#import "BSStructure.h"
#import "BSStructurePath.h"

@interface BSAtlasSectionView : UIView

@property (nonatomic, strong) UIImageView *backingView;
@property (nonatomic, strong) UIImageView *arteryView;
@property (nonatomic, strong) BSSection   *section;
@property (assign           ) bool        isRotated;


+ (BSAtlasSectionView *) atlasSectionViewForSection:(int) number;

- (id)      initWithFrame:(CGRect)frame andSection:(BSSection *)section;
- (void)    setStructures:(NSArray *)structures;
- (void)    arteryImageNamed:(NSString *)imageName;
- (void)    purgeCache;

- (void)    fade;
- (void)    unfade;

- (void)    rotateView;
- (void)    rotateViewRight;
- (void)    rotateViewLeft;

@end
