//
//  SmoothLineView.h
//  Smooth Line View
//
//  Created by Levi Nunnink on 8/15/11.
//  Copyright 2011 culturezoo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface BSDrawView : UIView

@property (nonatomic, strong)   NSMutableArray *drawingPaths;
@property (nonatomic, strong)   UIColor *lineColor;
@property (nonatomic)           CGFloat lineWidth;
@property (nonatomic)           CGMutablePathRef constuctionPath;
@property (nonatomic)           BOOL empty;

-(void) undo;
-(void) clear;

@end
