//
//  BSAtlasSectionView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSAtlasSectionView.h"

#define ATLAS_SECTION_VIEW_LINE_WIDTH 2
#define ATLAS_SECTION_VIEW_PATH_COLOR [UIColor yellowColor]

@implementation BSAtlasSectionView

- (instancetype)initWithFrame:(CGRect)frame andSection:(BSSection *)section
{
    self = [super initWithFrame:frame];
    if (self) {
        self.section = section;
        self.backingView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backingView.image = [self.section atlasImage];

        self.arteryView = [[UIImageView alloc] initWithFrame:self.bounds];

        self.operationQueue = [[NSOperationQueue alloc] init];
        [self.operationQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];

        self.structureLayersCache = [[NSMutableDictionary alloc] init];
        
        [self addSubview:self.backingView];
        [self addSubview:self.arteryView];
        
    }
    return self;
}

+ (BSAtlasSectionView *) atlasSectionViewForSection:(NSInteger)number
{
    BSAtlasSectionView *theView = [[BSAtlasSectionView alloc] initWithFrame:[self frameForSectionNumber:number] andSection:[BSSection atlasSectionNumber:number]];
    return theView;
}

- (void)setStructures:(NSArray *)structures
{
    [self.operationQueue cancelAllOperations];
    
    for (UIView *subview in self.backingView.subviews) {
        [subview setHidden:YES];
    }
    
    for (BSStructure *structure in structures) {
        [self showStructure:structure];
    }
}

- (void)arteryImageNamed:(NSString *)imageName
{
    if (imageName) {
        [self.arteryView setImage:[UIImage imageNamed:imageName]];
    }else{
        [self.arteryView setImage:nil];
     }
}

- (void)showStructure:(BSStructure *) structure
{
    UIImageView *structureImageView = [self.structureLayersCache objectForKey:@(structure.hash)];
    if (structureImageView) {
        [structureImageView setHidden:NO];
    }
    else {
        [self.operationQueue addOperationWithBlock:^{
            UIImage *newStructure = [self drawStructure:structure];
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImageView *newStructureView = [[UIImageView alloc] initWithFrame:self.bounds];
                [newStructureView setImage:newStructure];
                [self.backingView addSubview:newStructureView];
                [self.structureLayersCache setObject:newStructureView forKey:@(structure.hash)];
            });
        }];
    }
}

- (UIImage *)drawStructure:(BSStructure *)structure
{
    CGSize size = self.backingView.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    BSStructurePath *currPath = [structure structurePathInSection:self.section.sectionNumber];
    [ATLAS_SECTION_VIEW_PATH_COLOR setStroke];
    CGContextSetLineWidth(currentContext, ATLAS_SECTION_VIEW_LINE_WIDTH);

    CGContextSetLineCap(currentContext, kCGLineCapRound);
    CGContextSetLineJoin(currentContext, kCGLineJoinRound);
    CGContextSetFlatness(currentContext, 0);
 
    CGPathRef scaledPath = [BSStructure newScaledPath:currPath.pathData.CGPath toRect:self.bounds];
    CGContextAddPath(currentContext, scaledPath);
    CGContextDrawPath(currentContext, kCGPathStroke);

    CFRelease(scaledPath);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)fade
{
    [self.backingView setAlpha:0.3];
}
- (void)unfade
{
    [self.backingView setAlpha:1.0];
}

#pragma mark Rotation Methods
#define SECTION_3_Y_ROTATION_OFFSET 35

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
        if (self.section.sectionNumber == 3) {
            if (self.isRotated) {
                [self setCenter:CGPointMake(self.center.x, self.center.y - (SECTION_3_Y_ROTATION_OFFSET/2))];
            }else{
                [self setCenter:CGPointMake(self.center.x, self.center.y + (SECTION_3_Y_ROTATION_OFFSET/2))];
            }
        }
        self.layer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(a));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            if (self.section.sectionNumber == 3) {
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

+ (CGRect)frameForSectionNumber:(NSInteger)num
{
    CGRect bounds = [self getBoundsForSection:num];
    CGPoint desiredCenter = [self getCenterForSection:num];
    CGFloat initialCenterX = CGRectGetMidX(bounds);
    CGFloat initialCenterY = CGRectGetMidY(bounds);
    CGRect finalFrame = CGRectMake(desiredCenter.x - initialCenterX, desiredCenter.y - initialCenterY, bounds.size.width, bounds.size.height);
    return finalFrame;
}

+ (CGRect)getBoundsForSection:(NSInteger)num
{
    CGFloat scaleFactor = 0;
    
    switch (num) {
        case 0:
            scaleFactor = .15;
            break;
        case 1:
            scaleFactor = .15;
            break;
        case 2:
            scaleFactor = .16;
            break;
        case 3:
            scaleFactor= .17;
            break;
        case 4:
            scaleFactor = .2;
            break;
        case 5:
            scaleFactor = .21;
            break;
        case 6:
            scaleFactor = .21;
            break;
        case 7:
            scaleFactor = .21;
            break;
        case 8:
            scaleFactor = .21;
            break;
            
        default:
            NSLog(@"Error switching in section view frame creation");
            break;
    }
    
    // Hardcoded sizes
    return CGRectMake(0, 0, (CAPTURE_DEVICE_WIDTH * scaleFactor), (CAPTURE_DEVICE_HEIGHT * scaleFactor));
}

+ (CGPoint)getCenterForSection:(NSInteger)num
{
    CGPoint newCenter;
    
    switch (num) {
        case 0:
            newCenter = CGPointMake(230, 940);
            break;
        case 1:
            newCenter = CGPointMake(390, 940);
            break;
        case 2:
            newCenter = CGPointMake(580, 940);
            break;
        case 3:
            newCenter = CGPointMake(650, 775);
            break;
        case 4:
            newCenter = CGPointMake(651, 640);
            break;
        case 5:
            newCenter = CGPointMake(656, 470);
            break;
        case 6:
            newCenter = CGPointMake(660, 280);
            break;
        case 7:
            newCenter = CGPointMake(560, 105);
            break;
        case 8:
            newCenter = CGPointMake(315, 95);
            break;
            
        default:
            NSLog(@"Error switching in section view frame creation");
            break;
    }
    return newCenter;
}

- (void)purgeCache
{
    self.structureLayersCache = [[NSMutableDictionary alloc] init];
    [self.operationQueue cancelAllOperations];
    for (UIView *sub in self.backingView.subviews) {
        [sub removeFromSuperview];
    }
    self.arteryView.image = nil;
}

@end
