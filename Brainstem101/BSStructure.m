//
//  BSStructure.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructure.h"

@implementation BSStructure

- (instancetype)initWithName:(NSString *)name andType:(BSStructureType)type
{
    if (self = [super init])
    {
        self.structureName = name;
        self.structureType = type;
        self.conventionalName = [BSStructure getConventionalNameWithName:name andType:type];

        // [self generateStructurePathsFromXML];
        if (self.structureType == BSStructureTypeArtery) {
            // Arteries are the only ones who have artery images
            self.arteryImages = [[NSMutableArray alloc] initWithArray:@[@"", @"", @"", @"", @"", @"", @"", @"", @""]];
        }else{
            // Arteries don't have structurePaths, so only look for path data from non-arteries
            self.structurePaths = [[NSMutableArray alloc] init];
            [self generateStructurePathsFromJSON];
        }
        
        [self generateImageDictionary];
    }
    return self;
}

#pragma mark -
#pragma mark NSCoder
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        self.structureName = [coder decodeObjectForKey:@"structureName"];
        self.structureDescription = [coder decodeObjectForKey:@"structureDescription"];
        self.conventionalName = [coder decodeObjectForKey:@"conventionalName"];
        self.arteryImages = [coder decodeObjectForKey:@"arteryImages"];
        self.structureType = (BSStructureType)[coder decodeIntegerForKey:@"structureType"];
        
        // [self generateStructurePathsFromXML];
        if (self.structureType != BSStructureTypeArtery) {
            // Arteries don't have structurePaths, so only look for path data from non-arteries
            self.structurePaths = [[NSMutableArray alloc] init];
            [self generateStructurePathsFromJSON];
        }
        
        [self generateImageDictionary];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.structureName forKey:@"structureName"];
    [aCoder encodeObject:self.structureDescription forKey:@"structureDescription"];
    [aCoder encodeObject:self.conventionalName forKey:@"conventionalName"];
    [aCoder encodeObject:self.arteryImages forKey:@"arteryImages"];
    [aCoder encodeInteger:self.structureType forKey:@"structureType"];
}

#pragma mark -
#pragma mark
+ (NSString *)getConventionalNameWithName:(NSString *)name andType:(BSStructureType)type
{
    NSString *cName = [name lowercaseString];
    cName = [cName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    
    NSRange range;
    switch (type) {
        case BSStructureTypeNucleus:
            range = [cName rangeOfString:@"-nucleus" options:NSBackwardsSearch];
            if (range.location == NSNotFound) {
                range = [cName rangeOfString:@"-nuclei" options:NSBackwardsSearch];
            }
            
            if ([cName rangeOfString:@"-nucleus-and-tract" options:NSBackwardsSearch].location != NSNotFound) {
                range = [cName rangeOfString:@"-nucleus-and-tract" options:NSBackwardsSearch];
            }
            
            if(range.location != NSNotFound) {
                cName = [cName stringByReplacingCharactersInRange:range withString:@""];
            }
            cName = [cName stringByAppendingString:@"-n"];
            break;
            
        case BSStructureTypeTract:
            range = [cName rangeOfString:@"-tract" options:NSBackwardsSearch];
            if(range.location != NSNotFound) {
                cName = [cName stringByReplacingCharactersInRange:range withString:@""];
            }
            cName = [cName stringByAppendingString:@"-t"];
            break;
            
        case BSStructureTypeArtery:
            range = [cName rangeOfString:@"-artery" options:NSBackwardsSearch];
            if(range.location != NSNotFound) {
                cName = [cName stringByReplacingCharactersInRange:range withString:@""];
            }
            cName = [cName stringByAppendingString:@"-a"];
            break;
            
        case BSStructureTypeMiscellaneous:
            range.location = NSNotFound;
            if(range.location != NSNotFound) {
                cName = [cName stringByReplacingCharactersInRange:range withString:@""];
            }
            cName = [cName stringByAppendingString:@"-m"];
            break;
            
        case BSStructureTypeCranialNerve:
            cName = [cName stringByReplacingOccurrencesOfString:@"cn-" withString:@""];
            cName = [cName stringByReplacingOccurrencesOfString:@"(" withString:@""];
            cName = [cName stringByReplacingOccurrencesOfString:@")" withString:@""];
            cName = [cName stringByAppendingString:@"-cn"];
            break;
            
        default:
            NSLog(@"Something went wrong in bsstructure get conventional name");
            break;
    }
    return cName;
}

- (void)addArteryNamed:(NSString *) name forIndecies:(NSArray *)indicies
{
    for (NSNumber *number in indicies) {
        NSString *tmp = [NSString stringWithFormat:@"%@-%d.png",name, number.integerValue];
        self.arteryImages[number.integerValue] = [tmp copy];
    }
}

- (void)generateStructurePathsFromJSON
{
    NSError *error;
    
    for (NSInteger sectionNumber = 0; sectionNumber <= NUMBER_OF_SECTIONS; sectionNumber++) {
        NSString *jsonPath = [NSString stringWithFormat:@"%@-%ld.json", self.conventionalName, (long)sectionNumber];
        
        if ([self doesFileExsist:jsonPath]) {
            
            NSString *fileFound = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], jsonPath];
            UIBezierPath *loadedPathData = [UIBezierPathSerialization bezierPathWithData:[NSData dataWithContentsOfFile:fileFound] options:0 error:&error];
            if (error) {NSLog(@"%@", error.debugDescription);}
            
            BSStructurePath *newStructurePath = [[BSStructurePath alloc] init];
            [newStructurePath setPathData:loadedPathData];
            [newStructurePath setSectionNumber:sectionNumber];
            [self.structurePaths addObject:newStructurePath];
        }
    }
}

- (BOOL)doesFileExsist:(NSString *) fileName
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], fileName]];
}

- (void)generateImageDictionary
{
    NSString *tmpStr = [NSString stringWithFormat:@"%@-overlay-back.png", self.conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        self.stemViewOverlayBack = tmpStr;
    }
    tmpStr = [NSString stringWithFormat:@"%@-overlay-side.png", self.conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        self.stemViewOverlaySide = tmpStr;
    }
    tmpStr = [NSString stringWithFormat:@"%@-overlay-front.png", self.conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        self.stemViewOverlayFront = tmpStr;
    }
}

- (BSStructurePath *)structurePathInSection:(NSInteger)sectionNumber
{
    for (BSStructurePath *path in self.structurePaths) {
        if (path.sectionNumber == sectionNumber) {
            return path;
        }
    }
    return nil;
}

// TODO : Change this eventually
- (BOOL)hasArteryInSectionNumber:(NSInteger)num
{
    return [self.arteryImages[num] length] != 0;
}

- (CAShapeLayer *)shapeLayerForSectionNumber:(NSInteger)sectionNumber andBounds:(CGRect)bounds
{
    // Shape Rendering
    CAShapeLayer *tmpLayer = [CAShapeLayer layer];
    [tmpLayer setFrame:bounds];
    
    UIBezierPath *path = [[self structurePathInSection:sectionNumber] pathData];
    
    [tmpLayer setPath:[BSStructure newScaledPath:path.CGPath toRect:bounds]];
    [tmpLayer setStrokeColor:UIColorFromRGBWithAlpha(0xdcbc76, 1).CGColor];
    [tmpLayer setFillColor:[UIColor clearColor].CGColor];
    [tmpLayer setLineWidth:2];
    [tmpLayer setLineCap:kCALineCapRound];
    

    return tmpLayer;
}

+ (CGPathRef)newScaledPath:(CGPathRef)path toRect:(CGRect)rect
{
    CGFloat individualFrameFactor = (rect.size.height)/CAPTURE_DEVICE_HEIGHT;
    CGFloat scaleFactor = individualFrameFactor;
    
    CGAffineTransform scaleTransform = CGAffineTransformIdentity;
    scaleTransform = CGAffineTransformScale(scaleTransform, scaleFactor, scaleFactor);
    
    CGPathRef scaledPath = CGPathCreateCopyByTransformingPath(path, &scaleTransform);
    
    return scaledPath;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"BSStructure %@ (%@), type: %u, paths: %lu", self.structureName, self.conventionalName, self.structureType, (unsigned long)self.structurePaths.count];
}

@end
