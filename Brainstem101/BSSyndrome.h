//
//  BSSyndrome.h
//  Brainstem101
//
//  Created by Brian Freese on 12/5/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSDeficit.h"

@interface BSSyndrome : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *sectionImageName;
@property (strong, nonatomic) NSString *mugshotImageName;
@property (strong, nonatomic) NSString *perfusionDiagram;
@property (strong, nonatomic) NSString *perfusionDiagramOverlay;
@property (strong, nonatomic) NSMutableArray *deficits;

-(id)initWithName:(NSString *) name;

-(void)addSymptoms:(NSString *)structure andDeficit:(NSString *)symptoms;
    
@end
