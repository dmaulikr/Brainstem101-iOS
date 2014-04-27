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
{
    NSMutableArray *currentStructures;
    NSMutableDictionary *structureLayersCache;
    NSOperationQueue *operationQueue;
}

- (id)initWithFrame:(CGRect)frame andSection:(BSSection *)section{
    self = [super initWithFrame:frame];
    if (self) {
        _section = section;
        self.backingView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backingView.image = [self.section atlasImage];
        
        self.arteryView = [[UIImageView alloc] initWithFrame:self.bounds];

        operationQueue = [NSOperationQueue new];
        structureLayersCache = [NSMutableDictionary new];
        
        [self addSubview:_backingView];
        [self addSubview:_arteryView];
        
    }
    return self;
}

+ (BSAtlasSectionView *) atlasSectionViewForSection:(int) number
{
    BSAtlasSectionView *theView = [[BSAtlasSectionView alloc] initWithFrame:[self frameForSectionNumber:number] andSection:[BSSection atlasSectionNumber:number]];
    return theView;
}

-(void)setStructures:(NSArray *)structures
{
    
    [operationQueue cancelAllOperations];
    
    for (UIView *subview in _backingView.subviews) {
        [subview setHidden:YES];
    }
    
    for (BSStructure *structure in structures) {
        [self showStructure:structure];
    }
    
}

- (void) arteryImageNamed:(NSString *)imageName{
    if (imageName) {
        [self.arteryView setImage:[UIImage imageNamed:imageName]];
        [self.arteryView setAlpha:1];
    }else{
        [self.arteryView setAlpha:0];
     }
}

- (void) showStructure:(BSStructure *) structure
{
    UIImageView *structureImageView = structureLayersCache[structure.structureName];
    if (structureImageView) {
        [structureImageView setHidden:NO];
    }else if (structureImageView == nil) {
        [operationQueue addOperationWithBlock:^{
            UIImage *newStructure = [self drawStructure:structure];
            // add to view
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIImageView *newStructureView = [[UIImageView alloc] initWithFrame:self.bounds];
                [newStructureView setImage:newStructure];
                [_backingView addSubview:newStructureView];
                structureLayersCache[structure.structureName] = newStructureView;
            }];
        }];
    }
    
}


- (UIImage *) drawStructure:(BSStructure *)structure
{

    CGSize retinaSize = self.backingView.bounds.size;
    retinaSize.height = retinaSize.height * 2;
    retinaSize.width = retinaSize.width * 2;
    
    UIGraphicsBeginImageContext(retinaSize);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    BSStructurePath *currPath = (structure.structurePaths)[_section.sectionNumber];
    [ATLAS_SECTION_VIEW_PATH_COLOR setStroke];
    CGContextSetLineWidth(currentContext, ATLAS_SECTION_VIEW_LINE_WIDTH);

    CGContextSetLineCap(currentContext, kCGLineCapRound);
    CGContextSetLineJoin(currentContext, kCGLineJoinRound);
    CGContextSetFlatness(currentContext, 0);
 
    CGPathRef scaledPath = [self newScaledPath:currPath.pathData.CGPath toRect:self.backingView.bounds];
    CGContextAddPath(currentContext, scaledPath);
    CGContextDrawPath(currentContext, kCGPathStroke);

    CFRelease(scaledPath);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void) fade{
    [self.backingView setAlpha:0.3];
}
- (void) unfade{
    [self.backingView setAlpha:1.0];
}

#pragma mark Rotation Methods
#define ROTATION_SPEED 0.4
#define SECTION_3_Y_ROTATION_OFFSET 35

- (void)rotateView{
    [self rotateViewRight];
}

- (void)rotateViewRight{
    if (self.isRotated) {
        [self rotateViewFromDegree:270 toDegree:0];
    }else{
        [self rotateViewFromDegree:90 toDegree:180];
    }
}

- (void)rotateViewLeft{
    if (_isRotated) {
        [self rotateViewFromDegree:90 toDegree:0];
    }else{
        [self rotateViewFromDegree:270 toDegree:180];
    }
}

- (void) rotateViewFromDegree:(int)a toDegree:(int)b{
    [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (_section.sectionNumber == 3) {
            if (_isRotated) {
                [self setCenter:CGPointMake(self.center.x, self.center.y - (SECTION_3_Y_ROTATION_OFFSET/2))];
            }else{
                [self setCenter:CGPointMake(self.center.x, self.center.y + (SECTION_3_Y_ROTATION_OFFSET/2))];
            }
        }
        self.layer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(a));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:ROTATION_SPEED/2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            if (_section.sectionNumber == 3) {
                if (_isRotated) {
                    [self setCenter:CGPointMake(self.center.x, self.center.y - (SECTION_3_Y_ROTATION_OFFSET/2))];
                }else{
                    [self setCenter:CGPointMake(self.center.x, self.center.y + (SECTION_3_Y_ROTATION_OFFSET/2))];
                }
            }
            self.layer.affineTransform = CGAffineTransformMakeRotation(DegreesToRadians(b));
        } completion:^(BOOL finished) {
            _isRotated = !_isRotated;
        }];
    }];
}

+ (CGRect)frameForSectionNumber:(int)num{
    CGRect bounds = [self getBoundsForSection:num];
    CGPoint desiredCenter = [self getCenterForSection:num];
    float initialCenterX = CGRectGetMidX(bounds);
    float initialCenterY = CGRectGetMidY(bounds);
    CGRect finalFrame = CGRectMake(desiredCenter.x - initialCenterX, desiredCenter.y - initialCenterY, bounds.size.width, bounds.size.height);
    return finalFrame;
}

+ (CGRect)getBoundsForSection:(int)num{
    
    float scaleFactor = 0;
    
    switch (num) {
        case 0:
            scaleFactor = 1.5;
            break;
        case 1:
            scaleFactor = 1.5;
            break;
        case 2:
            scaleFactor = 1.6;
            break;
        case 3:
            scaleFactor= 1.7;
            break;
        case 4:
            scaleFactor = 2;
            break;
        case 5:
            scaleFactor = 2.1;
            break;
        case 6:
            scaleFactor = 2.1;
            break;
        case 7:
            scaleFactor = 2.1;
            break;
        case 8:
            scaleFactor = 2.1;
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

+ (CGPoint)getCenterForSection:(int)num{
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
     
- (CGPathRef)newScaledPath:(CGPathRef)path toRect:(CGRect) rect
{
    
    CGFloat individualFrameFactor = (rect.size.height*2)/CAPTURE_DEVICE_HEIGHT;
    CGFloat scaleFactor = individualFrameFactor;
    
    CGAffineTransform scaleTransform = CGAffineTransformIdentity;
    scaleTransform = CGAffineTransformScale(scaleTransform, scaleFactor, scaleFactor);
    
    CGPathRef scaledPath = CGPathCreateCopyByTransformingPath(path, &scaleTransform);
    
    return scaledPath;
}

- (void)purgeCache
{
    [structureLayersCache removeAllObjects];
}

@end
