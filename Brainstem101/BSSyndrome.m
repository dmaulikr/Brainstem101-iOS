//
//  BSSyndrome.m
//  Brainstem101
//
//  Created by Brian Freese on 12/5/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSSyndrome.h"

@implementation BSSyndrome

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.syndromeName = name;
        
        self.conventionalName = name;
        self.conventionalName = [self.conventionalName lowercaseString];
        self.conventionalName = [self.conventionalName stringByReplacingOccurrencesOfString:@"\'s" withString:@""];
        self.conventionalName = [self.conventionalName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        
        self.sectionImageName = [NSString stringWithFormat:@"%@-sec.png", self.conventionalName] ;
        self.mugshotImageName = [NSString stringWithFormat:@"%@-mug.png", self.conventionalName];
        self.perfusionDiagramOverlay = [NSString stringWithFormat:@"%@-perf.png", self.conventionalName];
        self.perfusionDiagram = @"perfusion-background.png";

        self.deficits = [NSMutableArray new];
        
    }
    return self;
}

- (void)addSymptoms:(NSString *)symptoms andDeficit:(NSString *)deficit
{
    [self.deficits addObject:[[BSDeficit alloc] initWithSymptoms:symptoms andDeficit:deficit]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"BSSyndrome %@ (%@), deficits: %lu, (%@, %@)",
            self.syndromeName, self.conventionalName, (unsigned long)self.deficits.count, self.mugshotImageName, self.sectionImageName];
}

@end
