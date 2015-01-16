//
//  BSSectionView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSDrawSectionView.h"

@implementation BSDrawSectionView

- (instancetype)initWithFrame:(CGRect)frame andSectionNumber:(NSInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNewSectionNumber:number];
        [self setClipsToBounds:NO];

    }
    return self;
}

- (void)setNewSectionNumber:(NSInteger)number
{
    self.currentSectionNumber = number;
    
    if (self.backgroundLayer == nil) {
        self.backgroundLayer = [CALayer new];
        [self.backgroundLayer setFrame:self.bounds];
        [self.backgroundLayer setContentsGravity:kCAGravityResizeAspect];
        [self.layer addSublayer:_backgroundLayer];
    }
    if (self.pathLayer == nil) {
        self.pathLayer = [CALayer new];
        [self.pathLayer setFrame:self.bounds];
        [self.pathLayer setContentsGravity:kCAGravityResizeAspect];
        [self.backgroundLayer addSublayer:_pathLayer];
    }
    
    [self.backgroundLayer setContents:(id)[UIImage imageNamed:[NSString stringWithFormat:@"profile-sxn-%d",(int)self.currentSectionNumber]].CGImage];
    [self.pathLayer setContents:nil];
}


- (void)drawPaths:(NSMutableArray *)inputPaths
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // replace these with image dimensions somehow
        CGSize contextSize = CGSizeMake(CAPTURE_DEVICE_WIDTH, CAPTURE_DEVICE_HEIGHT);
        
        UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0.0);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(currentContext, 1, 1);
        CGContextClearRect(currentContext, self.frame);
        
        for (BSStructurePath *path in inputPaths) {
            
            [PROFILE_SECTION_VIEW_PATH_COLOR setStroke];
            [PROFILE_SECTION_VIEW_PATH_FILL_COLOR setFill];
            
            CGContextSetLineWidth(currentContext, PATH_THICKNESS_PROFILE);
            CGContextSetLineCap(currentContext, kCGLineCapRound);
            CGContextSetLineJoin(currentContext, kCGLineJoinRound);
            
            CGContextBeginPath(currentContext);
            
            CGContextAddPath(currentContext, path.pathData.CGPath);
            CGContextClosePath(currentContext);
            CGContextDrawPath(currentContext, kCGPathFillStroke);
        }
        
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.pathLayer setContents:(id)[img CGImage]];
        });
    });
}

@end
