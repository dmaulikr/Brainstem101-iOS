//
//  BSProfileSectionView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/23/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSProfileSectionView.h"
#import "BSProfileViewController.h"

@implementation BSProfileSectionView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:_backingView];
    for (id sublayer in _backingView.layer.sublayers) {
        if ([sublayer isKindOfClass:[CAShapeLayer class]]) {
            CAShapeLayer *shapeLayer = sublayer;
            if (CGPathContainsPoint(shapeLayer.path, 0, touchLocation, YES)) {
                [self unHighlightLayers];
                [self didSelectLayer:shapeLayer];
                break;
            }
        }
    }
}


- (void)setCurrentSection:(BSSection *)section
{
    _currentSection = section;
    ///animate out and in here
    if (!self.backingView) {
        CGFloat scaleFactor = self.bounds.size.height / CAPTURE_DEVICE_HEIGHT;
        CGRect newFrame = CGRectMake(0, 0, CAPTURE_DEVICE_WIDTH * scaleFactor, CAPTURE_DEVICE_HEIGHT * scaleFactor);
        self.backingView = [[UIImageView alloc] initWithFrame:newFrame];
        [self.backingView setCenter:CGPointMake(self.center.x, _backingView.center.y)];
        
        [self addSubview:_backingView];
    }
    
    self.backingView.image = [self.currentSection profileImage];
    
    NSArray *currentNuclei          = [[BSModel sharedModel] getType:BSStructureTypeNucleus inSection:self.currentSection.sectionNumber];
    NSArray *currentTracts          = [[BSModel sharedModel] getType:BSStructureTypeTract inSection:self.currentSection.sectionNumber];
    NSArray *currentMiscellaneous   = [[BSModel sharedModel] getType:BSStructureTypeMiscellaneous inSection:self.currentSection.sectionNumber];
    NSArray *currentCranialNerves   = [[BSModel sharedModel] getType:BSStructureTypeCranialNerve inSection:self.currentSection.sectionNumber];
    
    for (BSStructure *structure in self.currentStructures) {
        [structure.shapeLayer removeFromSuperlayer];
    }
    
    self.currentStructures = [[[currentNuclei arrayByAddingObjectsFromArray:currentTracts] arrayByAddingObjectsFromArray:currentMiscellaneous] arrayByAddingObjectsFromArray:currentCranialNerves];
    [self presentStructures];
}

- (void)didSelectLayer:(CAShapeLayer *)layer
{
    [self unHighlightLayers];
    
    [layer setFillColor:UIColorFromRGBWithAlpha(0x7a2804, 0.5).CGColor];
    
    for (BSStructure *structure in self.currentStructures) {
        if (layer == structure.shapeLayer) {
            [self.delegate didSelectStructure:structure];
            break;
        }
    }
}

- (void)unHighlightLayers
{
    for (BSStructure *structure in self.currentStructures) {
        [[structure shapeLayer] setFillColor:[UIColor clearColor].CGColor];
    }
}



#pragma mark Presentation Methods

- (void)presentStructures
{
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    strokeAnimation.duration = 1;
    strokeAnimation.fromValue = @0.0;
    strokeAnimation.toValue = @1.0;
    
    for (BSStructure *structure in self.currentStructures) {
        structure.shapeLayer = [structure shapeLayerForSectionNumber:self.currentSection.sectionNumber andBounds:self.backingView.bounds];
        [self.backingView.layer addSublayer:structure.shapeLayer];
        [structure.shapeLayer addAnimation:strokeAnimation forKey:@"strokeAnimation"];
    }
}

- (void)fade
{
    [self.backingView setAlpha:0.5];
}
- (void)unfade
{
    [self.backingView setAlpha:1.0];
}

#pragma mark Rotation Methods
- (void)rotateView
{
    [self rotateViewRight];
}

- (void)rotateViewRight
{
    if (self.isRotated) {
        [self rotateViewFromDegree:270 toDegree:0];
    }else{
        [self rotateViewFromDegree:90 toDegree:180];
    }
}

- (void)rotateViewLeft
{
    if (self.isRotated) {
        [self rotateViewFromDegree:90 toDegree:0];
    }else{
        [self rotateViewFromDegree:270 toDegree:180];
    }
}

- (void)rotateViewFromDegree:(int)a toDegree:(int)b
{
    [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (self.currentSection.sectionNumber == 3) {
            if (self.isRotated) {
                [self setCenter:CGPointMake(self.center.x, self.center.y - (SECTION_3_Y_ROTATION_OFFSET/2))];
            }else{
                [self setCenter:CGPointMake(self.center.x, self.center.y + (SECTION_3_Y_ROTATION_OFFSET/2))];
            }
        }
        self.layer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(a));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            if (self.currentSection.sectionNumber == 3) {
                if (self.isRotated) {
                    [self setCenter:CGPointMake(self.center.x, self.center.y - (SECTION_3_Y_ROTATION_OFFSET/2))];
                }else{
                    [self setCenter:CGPointMake(self.center.x, self.center.y + (SECTION_3_Y_ROTATION_OFFSET/2))];
                }
            }
            self.layer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(b));
        } completion:^(BOOL finished) {
            self.isRotated = !self.isRotated;
        }];
    }];
}

@end
