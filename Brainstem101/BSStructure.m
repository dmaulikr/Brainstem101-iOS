//
//  BSStructure.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructure.h"

@implementation BSStructure {
    NSXMLParser *parser;
    NSMutableString *constructionString;
    NSMutableArray *currentPoints;
    NSMutableArray *currentPaths;
    
    int currentSectionNumber;
    float currentX;
    float currentY;
    bool isParsingStuctureName;
    bool isParsingSection;
    bool isParsingPath;
    bool isParsingPoint;
    bool isParsingX;
    bool isParsingY;
}

-(id)initWithName:(NSString *)name andType:(BSStructureType)type{
    self = [super init];
    if (self) {
        _structureName = name;
        _structureType = type;
        _conventionalName = [BSStructure getConventionalNameWithName:name andType:type];
        
        // TODO : Fix this all!
        _structurePaths     = [[NSMutableArray alloc] initWithArray:@[@"", @"", @"", @"", @"", @"", @"", @"", @""]];
        _arteryImages       = [[NSMutableArray alloc] initWithArray:@[@"", @"", @"", @"", @"", @"", @"", @"", @""]];
        _stemViewOverlays   = [NSMutableDictionary new];

        [self generateStructurePaths];
        [self generateImageDictionary];
    }
    return self;
}

+ (NSString *)getConventionalNameWithName:(NSString *)name andType:(BSStructureType)type{
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

- (void) addArteryNamed:(NSString *) name forIndecies:(NSArray *) indicies{
    for (NSNumber *number in indicies) {
        NSString *tmp = [NSString stringWithFormat:@"%@-%d.png",name, number.intValue];
        _arteryImages[number.intValue] = tmp;
    }
}

-(void)generateStructurePaths{
    for (int i = 0; i < 9; i++) {
        currentSectionNumber = i;
        NSString *xmlPath = [NSString stringWithFormat:@"%@-%d.xml",_conventionalName, i];
        if ([self doesFileExsist:xmlPath]) {
            [self addXMLFilePath:[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], xmlPath]];
        }
    }
}

-(BOOL) doesFileExsist:(NSString *) fileName{
    return [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], fileName]];
}

//TODO: should also handle artery images
-(void)generateImageDictionary{
    NSString *tmpStr = [NSString stringWithFormat:@"%@-overlay-back.png", _conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        _stemViewOverlays[@"back"] = tmpStr;
    }
    tmpStr = [NSString stringWithFormat:@"%@-overlay-side.png", _conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        _stemViewOverlays[@"side"] = tmpStr;
    }
    tmpStr = [NSString stringWithFormat:@"%@-overlay-front.png", _conventionalName];
    if ([self doesFileExsist:tmpStr]) {
        _stemViewOverlays[@"front"] = tmpStr;
    }
}

-(BOOL)isInSectionNumber:(NSInteger)num{
    return ![_structurePaths[num] isKindOfClass:[NSString class]];
}

-(BOOL)hasArteryInSectionNumber:(NSInteger)num{
    return [_arteryImages[num] length] != 0;
}

#pragma mark NSXMLParser Methods

-(void) addXMLFilePath:(NSString *)xmlFilePath{

    constructionString = [NSMutableString new];
    currentPoints = [NSMutableArray new];
    currentPaths = [NSMutableArray new];
    
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

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)character{
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

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"structure"]) {
        BSStructurePath *newStructurePath = [BSStructurePath new];
        [newStructurePath setPath:[currentPaths copy]];
        _structurePaths[currentSectionNumber] = newStructurePath;
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

@end
