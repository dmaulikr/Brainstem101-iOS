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

@property (strong, nonatomic, readonly) NSArray *Nuclei;
@property (strong, nonatomic, readonly) NSArray *Tracts;
@property (strong, nonatomic, readonly) NSArray *Arteries;
@property (strong, nonatomic, readonly) NSArray *Miscellaneous;
@property (strong, nonatomic, readonly) NSArray *CranialNerves;
@property (strong, nonatomic, readonly) NSArray *allStructures;

@property (strong, nonatomic) NSArray *Syndromes;


@property (assign, nonatomic) BOOL inTutorialMode;

+ (instancetype)sharedModel;

- (NSMutableArray*)getType:(BSStructureType)type inSection:(NSInteger)sectionNumber;
- (BOOL)isFirstLaunch;

+ (NSString *)filepathForStructureType:(BSStructureType)structureType;
+ (void)exportPathDataForStructure:(BSStructure *)structure;

@end
