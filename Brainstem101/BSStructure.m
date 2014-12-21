//
//  BSStructure.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructure.h"

@implementation BSStructure
{
    NSXMLParser *parser;
    NSMutableString *constructionString;
    NSMutableArray *currentPoints;
    NSMutableArray *currentPaths;
    
    NSInteger currentSectionNumber;
    CGFloat currentX;
    CGFloat currentY;
    BOOL isParsingStuctureName;
    BOOL isParsingSection;
    BOOL isParsingPath;
    BOOL isParsingPoint;
    BOOL isParsingX;
    BOOL isParsingY;
}

- (instancetype)initWithName:(NSString *)name andType:(BSStructureType)type
{
    
    if (self = [super init]) {
        self.structureName = name;
        self.structureType = type;
        self.conventionalName = [BSStructure getConventionalNameWithName:name andType:type];

        self.structurePaths = [[NSMutableArray alloc] init];
        self.arteryImages = [[NSMutableArray alloc] initWithArray:@[@"", @"", @"", @"", @"", @"", @"", @"", @""]];

        [self generateStructurePaths];
        [self generateImageDictionary];
    }
    return self;
}

#pragma mark -
#pragma mark NSCoder

// TODO : Implement!

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
        _arteryImages[number.integerValue] = tmp;
    }
}

- (void)generateStructurePaths
{
    for (NSInteger i = 0; i < 9; i++) {
        currentSectionNumber = i;
        NSString *xmlPath = [NSString stringWithFormat:@"%@-%ld.xml", _conventionalName, (long)i];
        if ([self doesFileExsist:xmlPath]) {
            [self addXMLFilePath:[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], xmlPath]];
        }
    }
}

- (BOOL)doesFileExsist:(NSString *) fileName
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], fileName]];
}

- (void)generateImageDictionary
{
    NSString *tmpStr = [NSString stringWithFormat:@"%@-overlay-back.png", _conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        self.stemViewOverlayBack = tmpStr;
    }
    tmpStr = [NSString stringWithFormat:@"%@-overlay-side.png", _conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        self.stemViewOverlaySide = tmpStr;
    }
    tmpStr = [NSString stringWithFormat:@"%@-overlay-front.png", _conventionalName];
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

// TODO : Change this
- (BOOL)hasArteryInSectionNumber:(NSInteger)num
{
    return [self.arteryImages[num] length] != 0;
}

#pragma mark NSXMLParser Methods

- (void)addXMLFilePath:(NSString *)xmlFilePath
{
    constructionString    = [NSMutableString new];
    currentPoints         = [NSMutableArray new];
    currentPaths          = [NSMutableArray new];

    isParsingStuctureName = isParsingSection = isParsingPath = isParsingPoint = isParsingX = isParsingY = NO;

    parser = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfFile:xmlFilePath]];
    [parser setDelegate:self];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"section"]) {
        isParsingSection = YES;
    }else if ([elementName isEqualToString:@"path"]) {
        isParsingPath = YES;
    }else if ([elementName isEqualToString:@"point"]) {
        isParsingPoint = YES;
    }else if([elementName isEqualToString:@"x"]){
        isParsingX = YES;
    }else if([elementName isEqualToString:@"y"]){
        isParsingY = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)character{
    if (isParsingSection) {
        [constructionString appendString:character];
    }else if (isParsingPath && isParsingPoint) {
        if (isParsingX) {
            [constructionString appendString:character];
        }else if (isParsingY){
            [constructionString appendString:character];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"structure"]) {
        // Finished parsing a BSStructurePath
        BSStructurePath *newStructurePath = [[BSStructurePath alloc] init];
        [newStructurePath setPath:[currentPaths copy]];
        [newStructurePath setSectionNumber:currentSectionNumber];
        [self.structurePaths addObject:newStructurePath];
        
    }else if ([elementName isEqualToString:@"section"]) {
        [constructionString setString:@""];
        isParsingSection = NO;
    }else if ([elementName isEqualToString:@"path"]) {
        [currentPaths addObject:[currentPoints copy]];
        [currentPoints removeAllObjects];
        [constructionString setString:@""];
        isParsingPath = NO;
    }else if ([elementName isEqualToString:@"point"]) {
        NSValue *point = [NSValue valueWithCGPoint:CGPointMake(currentX, currentY)];
        [currentPoints addObject:point];
        [constructionString setString:@""];
        isParsingPoint = NO;
    }else if([elementName isEqualToString:@"x"]){
        currentX = [constructionString floatValue]/CAPTUREDEVICESCALEFACTOR;
        [constructionString setString:@""];
        isParsingX = NO;
    }else if([elementName isEqualToString:@"y"]){
        currentY = [constructionString floatValue]/CAPTUREDEVICESCALEFACTOR;
        [constructionString setString:@""];
        isParsingY = NO;
    }
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

@end
