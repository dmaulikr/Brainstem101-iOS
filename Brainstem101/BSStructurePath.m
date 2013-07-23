    //
    //  BSStructurePath.m
    //  Brainstem101
    //
    //  Created by Brian Freese on 10/7/12.
    //  Copyright (c) 2012 Brainstem101. All rights reserved.
    //

#import "BSStructurePath.h"

@implementation BSStructurePath

@synthesize pathData;

- (id)init
{
    self = [super init];
    if (self) {
        pathData        = [UIBezierPath new];
    }
    return self;
}

-(void)setPath:(NSMutableArray *)pathArrayData{
    self.pathData = [self convertArrayToBezierPath:pathArrayData];
}

-(UIBezierPath *)convertArrayToBezierPath:(NSMutableArray *)input{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for(int i = 0; i < [input count]; i++){
        [path moveToPoint:[input[i][0] CGPointValue]];
        
        int step = 4;
        for(int j = step-1; j < [input[i] count]; j = j + step){
            
            [path addQuadCurveToPoint:[input[i][j] CGPointValue] controlPoint:[input[i][j-(step/2)] CGPointValue]];
            // [path addLineToPoint:[[[input objectAtIndex:i] objectAtIndex:j] CGPointValue]];
        }
        
        [path closePath];
    }
    return path;
}

@end
