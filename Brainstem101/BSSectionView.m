//
//  BSSectionView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSSectionView.h"

#define ROTATION_SPEED 0.3

#define PROFILE_SECTION_VIEW_LINE_WIDTH 2
#define PROFILE_SECTION_VIEW_PATH_COLOR [UIColor yellowColor]
#define PROFILE_SECTION_VIEW_PATH_FILL_COLOR  [UIColor colorWithRed:1 green:1 blue:0 alpha:0.5]



@implementation BSSectionView

- (id) initWithFrame:(CGRect)frame andSectionNumber:(int) num
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNewSectionNumber:num];
        [self setClipsToBounds:NO];

    }
    return self;
}

-(void)setNewSectionNumber:(int)num
{
    self.sxnNumber = num;
    
    if (self.backgroundLayer == nil) {
        self.backgroundLayer = [CALayer new];
        [self.backgroundLayer setFrame:self.bounds];
        [self.backgroundLayer setContentsGravity:kCAGravityResizeAspect];
        [self.layer addSublayer:_backgroundLayer];
    }
    
    if (self.arteryLayer == nil) {
        self.arteryLayer = [CALayer new];
        [self.arteryLayer setFrame:self.bounds];
        [self.arteryLayer setContentsGravity:kCAGravityResizeAspect];
        [self.backgroundLayer addSublayer:_arteryLayer];
    }
    
    if (self.pathLayer == nil) {
        self.pathLayer = [CALayer new];
        [self.pathLayer setFrame:self.bounds];
        [self.pathLayer setContentsGravity:kCAGravityResizeAspect];
        [self.backgroundLayer addSublayer:_pathLayer];
    }
    
    if (self.selectionLayer == nil) {
        self.selectionLayer  = [CALayer new];
        [self.selectionLayer setFrame:self.bounds];
        [self.selectionLayer setContentsGravity:kCAGravityResizeAspect];
        [self.pathLayer addSublayer:_selectionLayer];
    }
    
    [self.backgroundLayer setContents:(id)[UIImage imageNamed:[NSString stringWithFormat:@"sxn-%d.png",num]].CGImage];
    [self.arteryLayer setContents:nil];
    [self.pathLayer setContents:nil];
    [self.selectionLayer setContents:nil];
}

- (void) arteryImageNamed:(NSString *)imageName
{
    if (imageName) {
        [self.arteryLayer setOpacity:0];
        [self.arteryLayer setContents:(id)[UIImage imageNamed:imageName].CGImage];

        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.arteryLayer setOpacity:0.75];
        } completion:nil];
        
    }else{
        [self.arteryLayer setContents:nil];
    }
}

-(BOOL)isPoint:(CGPoint)point inPath:(BSStructurePath*)path
{
    CGPoint scaledPoint = [self scaledPoint:point];
    
    if ([path.pathData containsPoint:scaledPoint]) {
        return YES;
    }
    return NO;
}

- (CGPoint) scaledPoint:(CGPoint)point
{
    float x = point.x*(CAPTURE_DEVICE_WIDTH/self.selectionLayer.frame.size.width);
    float y = point.y*(CAPTURE_DEVICE_HEIGHT/self.selectionLayer.frame.size.height);
    if (self.isRotated) {
        y = self.selectionLayer.frame.size.height*(CAPTURE_DEVICE_HEIGHT/self.selectionLayer.frame.size.height) - y;
    }
    CGPoint scaledPoint =  CGPointMake(x, y);
    return scaledPoint;
}

- (void) highlightPath:(BSStructurePath *) path{
    UIGraphicsBeginImageContext(CGSizeMake(CAPTURE_DEVICE_WIDTH, CAPTURE_DEVICE_HEIGHT));
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(currentContext, [[path pathData] CGPath]);
    CGContextSetLineWidth(currentContext,PROFILE_SECTION_VIEW_LINE_WIDTH );
    CGContextSetFlatness(currentContext, 1);
    
    [[UIColor colorWithRed:1 green:1 blue:0 alpha:.5] setFill]; //yellow with alpha channel
    [[UIColor clearColor] setStroke];
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    [self.selectionLayer setContents:(id)[img CGImage]];
    UIGraphicsEndImageContext();
}


- (void) drawPathsForProfile:(NSMutableArray *)inputPaths
{

    // replace these with image dimensions somehow
    UIGraphicsBeginImageContext(CGSizeMake(CAPTURE_DEVICE_WIDTH, CAPTURE_DEVICE_HEIGHT));
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(currentContext, 1, 1);
    CGContextClearRect(currentContext, self.frame);
    
    for (int i = 0; i < inputPaths.count; i++) {
        BSStructurePath *currPath = inputPaths[i];
        
        [PROFILE_SECTION_VIEW_PATH_COLOR setStroke];
        [PROFILE_SECTION_VIEW_PATH_FILL_COLOR setFill];
        
        CGContextSetLineWidth(currentContext, PATH_THICKNESS_PROFILE);
        CGContextSetLineCap(currentContext, kCGLineCapRound);
        CGContextSetLineJoin(currentContext, kCGLineJoinRound);

        CGContextBeginPath(currentContext);
        CGContextAddPath(currentContext, [[currPath pathData] CGPath]);
        CGContextClosePath(currentContext);
        CGContextDrawPath(currentContext, kCGPathFillStroke);
    }
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.pathLayer setContents:(id)[img CGImage]];
}

- (void) fade
{
    [[self backgroundLayer] setOpacity:0.5];
}
- (void) unfade
{
    [[self backgroundLayer] setOpacity:1.0];
}
- (void) clearPaths
{
    [[self pathLayer] setContents:nil];
}
- (void) hidePathsToggle
{
    [self.pathLayer setHidden:!self.pathLayer.hidden];
}

- (void)rotateView
{
    [UIView animateWithDuration:ROTATION_SPEED delay:0 options: UIViewAnimationOptionBeginFromCurrentState animations:
     ^{
         if (!self.isRotated) {
             self.backgroundLayer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(180));
         }else{
             self.backgroundLayer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(0));
         }
         
     } completion:^(BOOL finished){
         self.isRotated = !self.isRotated;
     }];
}


- (void)rotateViewRight
{
    int a;
    int b;
    if (self.isRotated) {
        a = 270;
        b = 0;
    }else{
        a = 90;
        b = 180;
    }
    
    [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backgroundLayer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(a));
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.backgroundLayer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(b));
            
        } completion:^(BOOL finished) {
            self.isRotated = !self.isRotated;
        }];
    }];

}

- (void)rotateViewLeft
{
    int a, b;
    if (self.isRotated) {
        a = 90;
        b = 0;
    }else{
        a = 270;
        b = 180;
    }
    
    [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backgroundLayer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(a));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.backgroundLayer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(b));
        } completion:^(BOOL finished) {
            self.isRotated = !self.isRotated;
        }];
    }];
}

+(CGRect)getFrameForSection:(int)num
{
    
    float scaleFactor = 0;

    switch (num) {
        case 0:
            scaleFactor = 1.5;
            break;
        case 1:
            scaleFactor = 1.5;
            break;
        case 2:
            scaleFactor = 1.5;
            break;
        case 3:
            scaleFactor= 1.60;
            break;
        case 4:
            scaleFactor = 1.85;
            break;
        case 5:
            scaleFactor = 1.95;
            break;
        case 6:
            scaleFactor = 1.9;
            break;
        case 7:
            scaleFactor = 1.8;
            break;
        case 8:
            scaleFactor = 1.8;
            break;
        default:
            NSLog(@"Error switching in section view frame creation");
            break;
    }

    float newWidth = CAPTURE_DEVICE_WIDTH*(scaleFactor/10);
    float newHeight = CAPTURE_DEVICE_HEIGHT*(scaleFactor/10);
    CGRect rFrame = CGRectMake(0, 0, newWidth, newHeight);
    return rFrame;
}

+(CGPoint)getCenterForSection:(int)num
{
    CGPoint newCenter;    
    
    switch (num) {
        case 0:
            newCenter = CGPointMake(297, 945.5);
            break;
        case 1:
            newCenter = CGPointMake(450, 930.5);
            break;
        case 2:
            newCenter = CGPointMake(598, 850);
            break;
        case 3:
            newCenter = CGPointMake(645, 713);
            break;
        case 4:
            newCenter = CGPointMake(651, 570); //center
            break;
        case 5:
            newCenter = CGPointMake(656, 420);
            break;
        case 6:
            newCenter = CGPointMake(662, 246);
            break;
        case 7:
            newCenter = CGPointMake(516.5, 146);
            break;
        case 8:
            newCenter = CGPointMake(320, 85);
            break;
            
        default:
            NSLog(@"Error switching in section view frame creation");
            break;
    }

    return newCenter;
}

+(CGRect)getFrameForClinicalSection
{
    float newWidth = CAPTURE_DEVICE_WIDTH*0.25;
    float newHeight = CAPTURE_DEVICE_HEIGHT*0.25;
    CGRect rFrame = CGRectMake(0, 0, newWidth, newHeight);
    return rFrame;
}


@end
