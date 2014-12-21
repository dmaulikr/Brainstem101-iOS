//
//  BSStructurePath.m
//  Brainstem101
//
//  Created by Brian Freese on 10/7/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructurePath.h"

@implementation BSStructurePath

#pragma mark -
#pragma mark NSCoding
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        NSError *error;
        self.sectionNumber = [coder decodeIntegerForKey:@"sectionNumber"];
        self.pathData = [UIBezierPathSerialization bezierPathWithData:[coder decodeObjectForKey:@"pathData"] options:0 error:&error];
        
        if (error) {
            NSLog(@"%@", error);
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSError *error;
    [aCoder encodeInteger:self.sectionNumber forKey:@"sectionNumber"];
    [aCoder encodeObject:[UIBezierPathSerialization dataWithBezierPath:self.pathData options:0 error:&error] forKey:@"pathData"];
    
    if (error) {
        NSLog(@"%@", error);
    }
}

- (void)setPath:(NSMutableArray *)pathArrayData
{
    self.pathData = [self convertArrayToBezierPath:pathArrayData];
}

- (UIBezierPath *)convertArrayToBezierPath:(NSMutableArray *)input
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (NSInteger i = 0; i < [input count]; i++){
        [path moveToPoint:[input[i][0] CGPointValue]];
        
        NSInteger step = 4;
        for (NSInteger j = step-1; j < [input[i] count]; j = j + step){
            [path addQuadCurveToPoint:[input[i][j] CGPointValue] controlPoint:[input[i][j-(step/2)] CGPointValue]];
        }
        
        [path closePath];
    }
    return path;
}

- (NSUInteger)hash
{
    return self.pathData.hash ^ self.sectionNumber;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"BSStructurePath %lu, sectionNumber: %ld", (unsigned long)self.hash, (long)self.sectionNumber];
}

- (NSData *)jsonData
{
    NSError *error;
    NSData *data = [UIBezierPathSerialization dataWithBezierPath:self.pathData options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", error.debugDescription);
        return nil;
    }
    
    return data;
    
}

@end
