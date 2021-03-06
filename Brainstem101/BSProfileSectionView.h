//
//  BSProfileSectionView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/23/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSSection.h"
#import "BSStructure.h"
#import "BSStructurePath.h"

@protocol BSProfileSectionViewDelegate <NSObject>

- (void)didSelectStructure:(BSStructure *)structure;

@end

@interface BSProfileSectionView : UIView

@property (nonatomic, strong) id<BSProfileSectionViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *backingView;
@property (nonatomic, strong) NSArray *currentStructures;
@property (nonatomic, strong) BSSection *currentSection;
@property (nonatomic, assign) BOOL isRotated;

- (void) rotateView;
- (void) rotateViewRight;
- (void) rotateViewLeft;

@end

