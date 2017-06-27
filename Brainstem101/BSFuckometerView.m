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
    
    self.backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.backgroundView setContentMode:UIViewContentModeScaleAspectFit];
    [self.backgroundView setImage:[UIImage imageNamed:@"fuckometer-background.png"]];
    [self.backgroundView setAlpha:0.0];
    
    self.needleView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.needleView setContentMode:UIViewContentModeScaleAspectFit];
    [self.needleView setImage:[UIImage imageNamed:@"fuckometer-needle.png"]];
    
    [self addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.needleView];
        
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self.backgroundView setAlpha:1];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.needleView.transform = CGAffineTransformMakeRotation(DegreesToRadians(AMOUNT/2));
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                self.needleView.transform = CGAffineTransformMakeRotation(DegreesToRadians(AMOUNT));
                
            } completion:^(BOOL finished) {
                completionBlock();
            }];
        }];
    }];

}

@end
