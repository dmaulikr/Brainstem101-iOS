    //
    //  BSStructurePath.h
    //  Brainstem101
    //
    //  Created by Brian Freese on 10/7/12.
    //  Copyright (c) 2012 Brainstem101. All rights reserved.
    //

@interface BSStructurePath : NSObject

@property (nonatomic, strong) UIBezierPath *pathData;

-(void)setPath:(NSMutableArray *)pathArrayData;

@end
