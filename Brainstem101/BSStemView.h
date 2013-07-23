//
//  BSStemView.h
//  StemView
//
//  Created by Cameron Ehrlich on 10/19/12.
//  Copyright (c) 2012 Cameron Ehrlich. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSStructure.h"

@interface BSStemView : UIView

@property (strong, nonatomic) UIImageView *mainView;
@property (strong, nonatomic) UIImageView *overlayView;
@property (strong, nonatomic) BSStructure *currentStructure;

-(void) show;
-(void) hide;

-(void) loadStructure:(BSStructure *) structure;
-(void) stemViewModeNext;
-(void) stemViewMovePrevious;
-(void) removeOverlays;

@end
