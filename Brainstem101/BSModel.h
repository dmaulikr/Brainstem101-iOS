//
//  BSModel.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/12/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//
#import "BSStructureGenerator.h"
#import "BSSyndromeGenerator.h"
#import "BSStructure.h"

@interface BSModel : NSObject

@property (strong, nonatomic) NSArray *Nuclei;
@property (strong, nonatomic) NSArray *Tracts;
@property (strong, nonatomic) NSArray *Arteries;
@property (strong, nonatomic) NSArray *Miscellaneous;
@property (strong, nonatomic) NSArray *CranialNerves;
@property (strong, nonatomic) NSArray *Syndromes;
@property (assign, nonatomic) BOOL inTutorialMode;
@property (assign, nonatomic) BOOL hasSeenFuckometer;

+ (id)sharedModel;

- (NSMutableArray*)getType:(BSStructureType)type inSection:(int)section;

- (BOOL) isFirstLaunch;

@end
