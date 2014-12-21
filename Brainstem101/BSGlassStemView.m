//
//  BSGlassStemView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/15/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSGlassStemView.h"
#import <UIView+Positioning.h>

const NSString *baseFileName = @"glass-stem";
const CGFloat sectionDistance = 100;

@implementation BSGlassStemView
{
    UIImageView *currentLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){

        self.imageLayers = [NSMutableArray new];
                
        for (int i = 0; i < 18; i++) {

            UIImageView *tmp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            [tmp setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-%d.png", baseFileName, i]]];
            [tmp setContentMode:UIViewContentModeScaleAspectFit];
            [self.imageLayers addObject:tmp];
            [self addSubview:self.imageLayers[i]];
        }
        
        [self setAlpha:0.0];
        self.hidden = YES;
        
    }
    return self;
}

- (void)show
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self setAlpha:1.0];
    } completion:nil];
}

- (void)hide
{
    [self retractLayer:currentLayer];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self setAlpha:0.0];
    } completion:nil];
}

- (void)presentSection:(NSInteger)section
{
    if (self.hidden) {
        [self show];
    }
    [self retractLayer:currentLayer];
     
    currentLayer = self.imageLayers[[self layerIndexForSection:section]];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [currentLayer setY:sectionDistance];
        [currentLayer setX: -1 * sectionDistance];
    } completion:nil];
}

-(void)retractLayer:(UIImageView *)layer
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [currentLayer setY:0];
        [currentLayer setX:0];
    } completion:nil];
}

- (NSInteger)layerIndexForSection:(NSInteger)number {
    switch (number) {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 5;
        case 3:
            return 7;
        case 4:
            return 9;
        case 5:
            return 11;
        case 6:
            return 13;
        case 7:
            return 15;
        case 8:
            return 17;
        default:
            NSLog(@"Invalid section choice");
            return 1;
            break;
    }
}

@end
