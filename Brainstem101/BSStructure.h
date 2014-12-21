//
//  BSStructure.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructurePath.h"

@interface BSStructure : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic) NSString            *structureName;
@property (strong, nonatomic) NSString            *structureDescription;
@property (strong, nonatomic) NSMutableArray      *structurePaths;
@property (strong, nonatomic) NSMutableArray      *arteryImages;
@property (strong, nonatomic) NSMutableDictionary *stemViewOverlays;
@property (strong, nonatomic) NSString            *conventionalName;
@property (strong, nonatomic) BSStructurePath     *currentStructurePath;
@property (assign, nonatomic) BSStructureType     structureType;
@property (strong, nonatomic) CAShapeLayer        *shapeLayer;

- (instancetype)initWithName:(NSString *)name andType:(BSStructureType)type;

+ (CGPathRef)newScaledPath:(CGPathRef)path toRect:(CGRect)rect;
+ (NSString *)getConventionalNameWithName:(NSString *)name andType:(BSStructureType)type;

- (CAShapeLayer *)shapeLayerForSectionNumber:(NSInteger)sectionNumber andBounds:(CGRect)bounds;

- (void)        addXMLFilePath:(NSString *)xmlFilePath;
- (void)        addArteryNamed:(NSString *) name forIndecies:(NSArray *) indicies;
- (void)        generateStructurePaths;

- (BOOL)        isInSectionNumber:(NSInteger)num;
- (BOOL)        hasArteryInSectionNumber:(NSInteger)num;

@end
