//
//  BSGlassStemView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/15/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSGlassStemView.h"

const NSString *baseFileName = @"glass-stem";
const float sectionSpeed = 0.5;
const float sectionDistance = 80;

@implementation BSGlassStemView{
    UIImageView *currentLayer;
    CGPoint selectedCenter;
    CGPoint normalCenter;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){

        self.imageLayers = [NSMutableArray new];
        
        normalCenter = self.center;
        normalCenter.y -= 50;
        normalCenter.x += 20;
        
        selectedCenter = CGPointMake(self.center.x - sectionDistance, self.center.y + sectionDistance);
        
        static float scaleFactor = 1.35;
        
        for (int i = 0; i < 18; i++) {

            UIImageView *tmp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 500*scaleFactor, 800*scaleFactor)];
            [tmp setCenter:normalCenter];
            [tmp setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-%d.png", baseFileName, i]]];
            [tmp setContentMode:UIViewContentModeScaleAspectFill];
            [self.imageLayers addObject:tmp];
            [self addSubview:_imageLayers[i]];
        }
        
        [self setAlpha:0.0];
        _hidden = YES;
        
    }
    return self;
}

-(void)show {
    [UIView animateWithDuration:0.5 delay:0 options:nil animations:^{
        [self setAlpha:1.0];
    } completion:nil];
}

-(void)hide {
    [self retractLayer:currentLayer];
    [UIView animateWithDuration:0.5 delay:0 options:nil animations:^{
        [self setAlpha:0.0];
    } completion:nil];
}

- (void)presentSection:(NSInteger)section{
    if (_hidden) {
        [self show];
    }
    [self retractLayer:currentLayer];
     
    currentLayer = _imageLayers[[self layerIndexForSection:section]];
    [UIView animateWithDuration:sectionSpeed delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [currentLayer setCenter:selectedCenter];
    } completion:nil];
}

-(void)retractLayer:(UIImageView *)layer{
    [UIView animateWithDuration:sectionSpeed delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [layer setCenter:normalCenter];
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
