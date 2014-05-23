//
//  BSProfileSectionView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/23/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSProfileSectionView.h"
#import "BSProfileViewController.h"

@interface BSShapeLayerWrap : NSObject
@property (strong, nonatomic) BSStructure *structure;
@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@end
@implementation BSShapeLayerWrap
@end

@implementation BSProfileSectionView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInView:_backingView];
        BOOL touchedOnLayer = NO;
        for (id sublayer in _backingView.layer.sublayers) {
            if ([sublayer isKindOfClass:[CAShapeLayer class]]) {
                CAShapeLayer *shapeLayer = sublayer;
                if (CGPathContainsPoint(shapeLayer.path, 0, touchLocation, YES)) {
                    touchedOnLayer = YES;
                    [self didSelectLayer:shapeLayer];
                }
            }
        }
        if (!touchedOnLayer) {
            [self unHighlightLayers];
        }
    }
}

- (void)didSelectLayer:(CAShapeLayer *)layer
{
    [self unHighlightLayers];
    
    [layer setFillColor:UIColorFromRGBWithAlpha(0x7a2804, 0.5).CGColor];
    
    for (BSShapeLayerWrap *slw in _currentStructures) {
        if (layer == [slw shapeLayer]) {
            [(BSProfileViewController *)_delegate didSelectStructure:[slw structure]];
        }
    }
}

-(void)unHighlightLayers
{
    for (BSShapeLayerWrap *slw in self.currentStructures) {
        [[slw shapeLayer] setFillColor:[UIColor clearColor].CGColor];
    }
}

-(void)setCurrentSection:(BSSection *)section{
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
    
    NSArray *allStructures = [[[currentNuclei arrayByAddingObjectsFromArray:currentTracts] arrayByAddingObjectsFromArray:currentMiscellaneous] arrayByAddingObjectsFromArray:currentCranialNerves];

    for (BSShapeLayerWrap *slw in _currentStructures) {
        [[slw shapeLayer] removeFromSuperlayer];
    }
    
    self.currentStructures = [NSMutableArray new];

    for (BSStructure *s in allStructures) {
        [self.currentStructures addObject:[self wrappedObjectForStructure:s]];
    }
    [self presentStructures];
}

-(BSShapeLayerWrap *)wrappedObjectForStructure:(BSStructure *)str
{
    BSShapeLayerWrap *shapeLayerWrap = [[BSShapeLayerWrap alloc] init];
    [shapeLayerWrap setStructure:str];
    
    // Shape Rendering
    CAShapeLayer *tmpLayer = [CAShapeLayer layer];
    [tmpLayer setFrame:_backingView.bounds];
    
    UIBezierPath *path = [[[str structurePaths] objectAtIndex:_currentSection.sectionNumber] pathData];
    
    [tmpLayer setPath:[self newScaledPath:path.CGPath toRect:_backingView.bounds]];
    [tmpLayer setStrokeColor:UIColorFromRGBWithAlpha(0xdcbc76, 1).CGColor];
    [tmpLayer setFillColor:[UIColor clearColor].CGColor];
    [tmpLayer setLineWidth:2];
    [tmpLayer setLineCap:kCALineCapRound];

    [shapeLayerWrap setShapeLayer:tmpLayer];
    return shapeLayerWrap;
}


#pragma mark Presentation Methods

- (void) presentStructures{
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    strokeAnimation.duration = 1.5;
    strokeAnimation.fromValue = @0.0;
    strokeAnimation.toValue = @1.0;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    alphaAnimation.duration = 1.5;
    alphaAnimation.fromValue = @0.0;
    alphaAnimation.toValue = @1.0;
    
    
    for (BSShapeLayerWrap *slw in _currentStructures) {
        // maybe check if it has been added before
        [_backingView.layer addSublayer:[slw shapeLayer]];
        [[slw shapeLayer] addAnimation:strokeAnimation forKey:@"strokeAnimation"];
        [[slw shapeLayer] addAnimation:alphaAnimation forKey:@"alphaAnimation"];
    }
}

- (void) fade{
    [_backingView setAlpha:0.5];
}
- (void) unfade{
    [_backingView setAlpha:1.0];
}

- (CGPathRef)newScaledPath:(CGPathRef)path toRect:(CGRect) rect {
    
    CGFloat scaleFactor = (rect.size.height)/CAPTURE_DEVICE_HEIGHT;
    
    CGAffineTransform scaleTransform = CGAffineTransformIdentity;
    scaleTransform = CGAffineTransformScale(scaleTransform, scaleFactor, scaleFactor);

    CGPathRef scaledPath = CGPathCreateCopyByTransformingPath(path, &scaleTransform);

    return scaledPath;
}

#pragma mark Rotation Methods
#define ROTATION_SPEED 0.4
#define SECTION_3_Y_ROTATION_OFFSET 35

- (void)rotateView{
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
