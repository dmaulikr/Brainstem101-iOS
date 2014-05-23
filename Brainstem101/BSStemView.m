//
//  BSStemView.m
//  StemView
//
//  Created by Cameron Ehrlich on 10/19/12.
//  Copyright (c) 2012 Cameron Ehrlich. All rights reserved.
//

#import "BSStemView.h"

#define BACK_VIEW_MODE 0
#define SIDE_VIEW_MODE 1
#define FRONT_VIEW_MODE 2

@implementation BSStemView{
    NSArray *imageArray;
    int currentViewMode;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        currentViewMode = BACK_VIEW_MODE;
        imageArray = @[[UIImage imageNamed:@"stem-back.png"],[UIImage imageNamed:@"stem-side.png"], [UIImage imageNamed:@"stem-front.png"]];
        
        self.mainView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.mainView];
        self.overlayView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.mainView addSubview:self.overlayView];
        
        [self removeOverlays];
    }
    return self;
}

-(void)show
{
    [UIView animateWithDuration:STEM_TRANSITION_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self setAlpha:1.0];
    } completion:nil];
}

-(void)hide
{
    [UIView animateWithDuration:STEM_TRANSITION_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self setAlpha:0.0];
    } completion:nil];
}

-(void)removeOverlays
{
    [self.overlayView setImage:nil];
    [self.mainView setImage:imageArray[currentViewMode]];
}

-(void)loadStructure:(BSStructure *) structure
{
    self.currentStructure = structure;
    
    bool hasFront   = ((_currentStructure.stemViewOverlays)[@"front"] ==  nil) ? false : true;
    bool hasBack    = ((_currentStructure.stemViewOverlays)[@"back"] ==  nil) ? false : true;
    bool hasSide    = ((_currentStructure.stemViewOverlays)[@"side"] ==  nil) ? false : true;
    bool hasOverlay =  (hasFront || hasSide || hasBack) ? YES : NO;
    
    if (!hasOverlay) {
        [self.overlayView setImage:nil];
        return;
    }
    if (currentViewMode == FRONT_VIEW_MODE && hasFront) {
        [self changeCurrentImageToViewMode:FRONT_VIEW_MODE];
    }else if (currentViewMode == SIDE_VIEW_MODE && hasSide){
        [self changeCurrentImageToViewMode:SIDE_VIEW_MODE];
    }else if (currentViewMode == BACK_VIEW_MODE && hasBack){
        [self changeCurrentImageToViewMode:BACK_VIEW_MODE];
    }else{
        if (hasBack) {
            [self changeCurrentImageToViewMode:BACK_VIEW_MODE];
        }else if (hasSide){
            [self changeCurrentImageToViewMode:SIDE_VIEW_MODE];
        }else if (hasFront){
            [self changeCurrentImageToViewMode:FRONT_VIEW_MODE];
        }else{
            NSLog(@"Error in choosing sectionView configuration in BSStemView");
        }
    }
}

-(void)changeCurrentImageToViewMode:(int)viewmode
{
    currentViewMode = viewmode;
    // TODO :  this animation could use a little work
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [_mainView setImage:imageArray[currentViewMode]];
        [_overlayView setImage:[UIImage imageNamed:(_currentStructure.stemViewOverlays)[[self getStringOfCurrentViewMode]]]];
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self setAlpha:1];
        } completion:nil];
    }];
}

-(NSString *)getStringOfCurrentViewMode
{
    switch (currentViewMode) {
        case FRONT_VIEW_MODE:
            return @"front";
        case SIDE_VIEW_MODE:
            return @"side";
        case BACK_VIEW_MODE:
            return @"back";
        default:
            NSLog(@"failed to find string for view mode");
            return @"back";
    }
}

-(void)stemViewModeNext
{
    currentViewMode++;
    if (currentViewMode == 3) {
        currentViewMode = 0;
    }
    [self changeCurrentImageToViewMode:currentViewMode];
}

-(void)stemViewMovePrevious
{
    currentViewMode--;
    if (currentViewMode == -1) {
        currentViewMode = 2;
    }
    [self changeCurrentImageToViewMode:currentViewMode];
}

@end
