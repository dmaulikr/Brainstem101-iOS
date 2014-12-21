//
//  BSStemView.m
//  StemView
//
//  Created by Cameron Ehrlich on 10/19/12.
//  Copyright (c) 2012 Cameron Ehrlich. All rights reserved.
//

#import "BSStemView.h"


@implementation BSStemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundImages = @{
                                  @(BSStemViewModeBack)     :[UIImage imageNamed:@"stem-back"],
                                  @(BSStemViewModeSide)     :[UIImage imageNamed:@"stem-side"],
                                  @(BSStemViewModeFront)    :[UIImage imageNamed:@"stem-front"]
                                  };
        
        self.backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.backgroundView];
        
        self.overlayView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.backgroundView addSubview:self.overlayView];
        
        // Defaults to the back view
        [self setCurrentStructure:nil];
    }
    return self;
}

- (void)setCurrentStructure:(BSStructure *)currentStructure
{
    _currentStructure = currentStructure;
    
    if (_currentStructure == nil) {
        [self changeCurrentImageToViewMode:BSStemViewModeBack];
        return;
    }

    BOOL hasBack  = self.currentStructure.stemViewOverlayBack ? YES : NO;
    BOOL hasSide  = self.currentStructure.stemViewOverlaySide ? YES : NO;
    BOOL hasFront = self.currentStructure.stemViewOverlayFront ? YES : NO;
    
    // If current structure doesn't have any overlays
    if ( !(hasFront | hasBack | hasSide) ) {
        [self.overlayView setImage:nil];
        return;
    }
    
    // Try to match perfectly with the current view mode
    switch (self.currentViewMode) {
        case BSStemViewModeBack:
            if (hasBack) {
                [self changeCurrentImageToViewMode:BSStemViewModeBack];
                return;
            }
            break;
        case BSStemViewModeSide:
            if (hasSide) {
                [self changeCurrentImageToViewMode:BSStemViewModeSide];
                return;
            }
            break;
        case BSStemViewModeFront:
            if (hasFront) {
                [self changeCurrentImageToViewMode:BSStemViewModeFront];
                return;
            }
            break;
        default:
            NSLog(@"Coudn't find an exact match!");
            break;
    }
    
    // If can't match with the current view mode, just follow this hard-coded order
    if (hasBack) {
        [self changeCurrentImageToViewMode:BSStemViewModeBack];
    }else if (hasSide){
        [self changeCurrentImageToViewMode:BSStemViewModeSide];
    }else if (hasFront){
        [self changeCurrentImageToViewMode:BSStemViewModeFront];
    }else{
        NSLog(@"ERROR : Should never reach here!");
    }
}


- (void)changeCurrentImageToViewMode:(BSStemViewMode)viewMode
{
    _currentViewMode = viewMode;

    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self.backgroundView setImage:[self.backgroundImages objectForKey:@(viewMode)]];
        
        switch (self.currentViewMode) {
            case BSStemViewModeBack:
                [self.overlayView setImage:[UIImage imageNamed:self.currentStructure.stemViewOverlayBack]];
                break;
            case BSStemViewModeSide:
                [self.overlayView setImage:[UIImage imageNamed:self.currentStructure.stemViewOverlaySide]];
                break;
            case BSStemViewModeFront:
                [self.overlayView setImage:[UIImage imageNamed:self.currentStructure.stemViewOverlayFront]];
                break;
            default:
                break;
        }
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self setAlpha:1];
        } completion:nil];
    }];
}

- (void)stemViewModeNext
{
    switch (self.currentViewMode) {
        case BSStemViewModeBack:
            [self changeCurrentImageToViewMode:BSStemViewModeSide];
            break;
        case BSStemViewModeSide:
            [self changeCurrentImageToViewMode:BSStemViewModeFront];
            break;
        case BSStemViewModeFront:
            [self changeCurrentImageToViewMode:BSStemViewModeBack];
            break;
        default:
            break;
    }
}

- (void)stemViewMovePrevious
{
    switch (self.currentViewMode) {
        case BSStemViewModeBack:
            [self changeCurrentImageToViewMode:BSStemViewModeFront];
            break;
        case BSStemViewModeSide:
            [self changeCurrentImageToViewMode:BSStemViewModeBack];
            break;
        case BSStemViewModeFront:
            [self changeCurrentImageToViewMode:BSStemViewModeSide];
            break;
        default:
            break;
    }
}


- (void)show
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self setAlpha:1.0];
    } completion:nil];
}

- (void)hide
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self setAlpha:0.0];
    } completion:nil];
}

@end
