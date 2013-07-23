//
//  BSSyndrome.m
//  Brainstem101
//
//  Created by Brian Freese on 12/5/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSSyndrome.h"

@implementation BSSyndrome

-(id)initWithName:(NSString *) syndromeName{
    self = [super init];
    if (self) {
        self.name = syndromeName;
        
        NSString *fileName = syndromeName;
        fileName = [fileName lowercaseString];
        fileName = [fileName stringByReplacingOccurrencesOfString:@"\'s" withString:@""];
        fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        
        _sectionImageName = [NSString stringWithFormat:@"%@-sec.png", fileName] ;
        _mugshotImageName = [NSString stringWithFormat:@"%@-mug.png", fileName];
        _perfusionDiagramOverlay = [NSString stringWithFormat:@"%@-perf.png", fileName];
        _perfusionDiagram = @"perfusion-background.png";

        _deficits = [NSMutableArray new];
        
    }
    return self;
}

-(void)addSymptoms:(NSString *)symptoms andDeficit:(NSString *)deficit {
    [[self deficits] addObject:[[BSDeficit alloc] initWithSymptoms:symptoms andDeficit:deficit]];
}

@end
