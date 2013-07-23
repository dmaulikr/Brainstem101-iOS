//
//  BSFuckometerView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/4/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSFuckometerView.h"

#define AMOUNT 261.5

@implementation BSFuckometerView

-(void)beginLoadingWithDuration:(int)duration andCallback:(void (^)(void))completionBlock{
    
    _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_backgroundView setContentMode:UIViewContentModeScaleAspectFit];
    [_backgroundView setImage:[UIImage imageNamed:@"fuckometer-background.png"]];
    [_backgroundView setAlpha:0.0];
    
    _needleView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_needleView setContentMode:UIViewContentModeScaleAspectFit];
    [_needleView setImage:[UIImage imageNamed:@"fuckometer-needle.png"]];
    [_needleView setAlpha:0.0];
    
    [self addSubview:_backgroundView];
    [self addSubview:_needleView];
    
    
    
    [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [_backgroundView setAlpha:1];
        [_needleView setAlpha:1];
        
        self.needleView.transform = CGAffineTransformMakeRotation(DegreesToRadians(AMOUNT/2));
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.needleView.transform = CGAffineTransformMakeRotation(DegreesToRadians(AMOUNT));
            
        } completion:^(BOOL finished) {
            completionBlock();
        }];
    }];
}

@end
