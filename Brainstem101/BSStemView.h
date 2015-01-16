//
//  BSStemView.h
//  StemView
//
//  Created by Cameron Ehrlich on 10/19/12.
//  Copyright (c) 2012 Cameron Ehrlich. All rights reserved.
//

#import "BSStructure.h"

typedef NS_ENUM(NSUInteger, BSStemViewMode) {
    BSStemViewModeBack = 0,
    BSStemViewModeSide,
    BSStemViewModeFront,
};

@interface BSStemView : UIView

@property (strong, nonatomic) UIImageView *backgroundView;
@property (strong, nonatomic) UIImageView *overlayView;
@property (strong, nonatomic) BSStructure *currentStructure;
@property (assign, nonatomic, readonly) BSStemViewMode currentViewMode;

- (void)show;
- (void)hide;

- (void)stemViewModeNext;
- (void)stemViewMovePrevious;

@end
