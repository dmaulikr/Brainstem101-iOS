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
    
    if (self.currentStructure == nil) {
        [[self overlayView] setImage:nil];
        [self changeCurrentImageToViewMode:BSStemViewModeBack];
        return;
    }

    BOOL hasBack  = self.currentStructure.stemViewOverlayBack ? YES : NO;
    BOOL hasSide  = self.currentStructure.stemViewOverlaySide ? YES : NO;
    BOOL hasFront = self.currentStructure.stemViewOverlayFront ? YES : NO;
    
    // If current structure doesn't have any overlays
    if ( !(hasFront | hasBack | hasSide) ) {
        [self.overlayView setImage:nil];
        [self changeCurrentImageToViewMode:self.currentViewMode];
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
    if (hasFront) {
        [self changeCurrentImageToViewMode:BSStemViewModeFront];
    }else if (hasSide){
        [self changeCurrentImageToViewMode:BSStemViewModeSide];
    }else if (hasBack){
        [self changeCurrentImageToViewMode:BSStemViewModeBack];
    }else{
        NSLog(@"ERROR : Should never reach here!");
    }
}

- (void)changeCurrentImageToViewMode:(BSStemViewMode)viewMode
{
    _currentViewMode = viewMode;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        
        // Set appropriate stem backing image
        switch (viewMode) {
            case BSStemViewModeBack:
                switch (self.currentStructure.structureType) {
                    case BSStructureTypeNucleus:
                        // Set to default background if the current structure is nil
                        if (self.currentStructure) {
                            [self.backgroundView setImage:[UIImage imageNamed:@"stem-back-nuclei"]];
                        }else{
                            [self.backgroundView setImage:[UIImage imageNamed:@"stem-back-default"]];
                        }
                        break;
                    default:
                        [self.backgroundView setImage:[UIImage imageNamed:@"stem-back-default"]];
                        break;
                }
                break;
            case BSStemViewModeSide:
                
                switch (self.currentStructure.structureType) {
                    case BSStructureTypeCranialNerve:
                        [self.backgroundView setImage:[UIImage imageNamed:@"stem-side-cranial"]];
                        break;
                    default:
                        [self.backgroundView setImage:[UIImage imageNamed:@"stem-side-default"]];
                        break;
                }
                break;
            case BSStemViewModeFront:
                switch (self.currentStructure.structureType) {
                    case BSStructureTypeArtery:
                        [self.backgroundView setImage:[UIImage imageNamed:@"stem-front-artery"]];
                        break;
                    case BSStructureTypeCranialNerve:
                        [self.backgroundView setImage:[UIImage imageNamed:@"stem-front-cranial"]];
                        break;
                    default:
                        [self.backgroundView setImage:[UIImage imageNamed:@"stem-front-default"]];
                        break;
                }
                break;
            default:
                break;
        }
        
        // Set the stem overlay image
        NSString *imageName;
        
        switch (self.currentViewMode) {
            case BSStemViewModeBack:
                imageName = self.currentStructure.stemViewOverlayBack;
                break;
            case BSStemViewModeSide:
                imageName = self.currentStructure.stemViewOverlaySide;
                break;
            case BSStemViewModeFront:
                imageName = self.currentStructure.stemViewOverlayFront;
                break;
            default:
                break;
        }
        
        if (imageName) {
            [self.overlayView setImage:[UIImage imageNamed:imageName]];
        }else{
            [self.overlayView setImage:nil];
        }
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self setAlpha:1];
        } completion:^(BOOL finished) {

        }];
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
