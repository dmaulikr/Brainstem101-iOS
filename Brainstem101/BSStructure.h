//
//  BSStructure.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructurePath.h"

@interface BSStructure : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic)   NSString *structureName;
@property (strong, nonatomic)   NSString *structureDescription;
@property (strong, nonatomic)   NSMutableArray *structurePaths;
@property (strong, nonatomic)   NSMutableArray *arteryImages;
@property (strong, nonatomic)   NSMutableDictionary *stemViewOverlays;
@property (strong, nonatomic)   NSString *conventionalName;
@property (strong, nonatomic)   BSStructurePath *currentStructurePath;
@property (nonatomic)           BSStructureType structureType;

- (id)          initWithName:(NSString *)name andType:(BSStructureType)type;

+ (NSString *)  getConventionalNameWithName:(NSString *)name andType:(BSStructureType)type;

- (void)        addXMLFilePath:(NSString *)xmlFilePath;
- (void)        addArteryNamed:(NSString *) name forIndecies:(NSArray *) indicies;
- (void)        generateStructurePaths;

- (BOOL)        isInSectionNumber:(int)num;
- (BOOL)        hasArteryInSectionNumber:(int)num;

@end
