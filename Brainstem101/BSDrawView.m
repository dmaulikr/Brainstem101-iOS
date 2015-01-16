//
//  SmoothLineView.m
//  Smooth Line View
//
//  Created by Levi Nunnink on 8/15/11.
//  Copyright 2011 culturezoo. All rights reserved.
//

#import "BSDrawView.h"

#define DEFAULT_COLOR [UIColor blackColor]
#define DEFAULT_WIDTH 3.0f
#define kPointMinDistance 0

@implementation BSDrawView
{
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
}

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    _lineWidth = DEFAULT_WIDTH;
    _lineColor = DEFAULT_COLOR;
    _empty = YES;
    _drawingPaths = [[NSMutableArray alloc] init];
    _constuctionPath = CGPathCreateMutable();
}

- (void)dealloc{
    CFRelease(_constuctionPath);
}

- (CGPoint)midPointOf:(CGPoint)p1 and:(CGPoint)p2
{
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

- (void)undo
{
    [_drawingPaths removeLastObject];
    [self setNeedsDisplayInRect:self.bounds];
}

- (void)clear
{
    [_drawingPaths removeAllObjects];
    _constuctionPath = CGPathCreateMutable();
    [self setNeedsDisplayInRect:self.bounds];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    previousPoint1 = [touch previousLocationInView:self];
    previousPoint2 = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
    
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
	
	CGPoint point = [touch locationInView:self];
	
	/* check if the point is farther than min dist from previous */
    CGFloat dx = point.x - currentPoint.x;
    CGFloat dy = point.y - currentPoint.y;
	
    if ((dx * dx + dy * dy) < (kPointMinDistance * kPointMinDistance)) {
        return;
    }
    
    previousPoint2 = previousPoint1;
    previousPoint1 = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
    
    CGPoint mid1 = [self midPointOf:previousPoint1 and:previousPoint2];
    CGPoint mid2 = [self midPointOf:currentPoint and:previousPoint1];
	CGMutablePathRef subpath = CGPathCreateMutable();
    CGPathMoveToPoint(subpath, NULL, mid1.x, mid1.y);
    CGPathAddQuadCurveToPoint(subpath, NULL, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
    CGRect bounds = CGPathGetBoundingBox(subpath);
    
    CGPathAddPath(_constuctionPath, nil, subpath);

    CGPathRelease(subpath);
        
    CGRect drawBox = bounds;
    drawBox.origin.x -= self.lineWidth * 2.0;
    drawBox.origin.y -= self.lineWidth * 2.0;
    drawBox.size.width += self.lineWidth * 4.0;
    drawBox.size.height += self.lineWidth * 4.0;

    [self setNeedsDisplayInRect:drawBox];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_drawingPaths addObject:[UIBezierPath bezierPathWithCGPath:_constuctionPath]];
    _constuctionPath = CGPathCreateMutable();
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor clearColor] set];
    UIRectFill(rect);
    
    CGMutablePathRef currPaths = CGPathCreateMutable();
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    
    for (UIBezierPath *path in _drawingPaths) {
        CGPathAddPath(currPaths, nil, path.CGPath);
    }
    
    CGPathAddPath(currPaths, nil, _constuctionPath);
    
    CGContextAddPath(context, currPaths);
    
    CFRelease(currPaths);
    CGContextStrokePath(context);
    
    self.empty = NO;
}

@end
