//
//  BSModel.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/12/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSModel.h"
#import <HRCoder/HRCoder.h>

@implementation BSModel

+ (instancetype)sharedModel
{
    static BSModel *modelSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modelSingleton = [[self alloc] init];
    });
    return modelSingleton;
}

- (instancetype)init
{
    if (self = [super init])
    {
        // Load in data from the local plists 
        _Nuclei        = [HRCoder unarchiveObjectWithFile:[BSModel filepathForStructureType:BSStructureTypeNucleus]];
        _Tracts        = [HRCoder unarchiveObjectWithFile:[BSModel filepathForStructureType:BSStructureTypeTract]];
        _Arteries      = [HRCoder unarchiveObjectWithFile:[BSModel filepathForStructureType:BSStructureTypeArtery]];
        _Miscellaneous = [HRCoder unarchiveObjectWithFile:[BSModel filepathForStructureType:BSStructureTypeMiscellaneous]];
        _CranialNerves = [HRCoder unarchiveObjectWithFile:[BSModel filepathForStructureType:BSStructureTypeCranialNerve]];
        
        _Syndromes     = [[BSSyndromeGenerator Syndromes] copy];
        
        // Tutorial logic
        self.inTutorialMode = NO;
        
        //        BSStructureGenerator *structuresObject = [[BSStructureGenerator alloc] init];
        //
        //        _Nuclei        = [[structuresObject Nuclei] copy];
        //        _Tracts        = [[structuresObject Tracts] copy];
        //        _Arteries      = [[structuresObject Arteries] copy];
        //        _Miscellaneous = [[structuresObject Miscellaneous] copy];
        //        _CranialNerves = [[structuresObject CranialNerves] copy];
        // Uncomment this to export
        // [self exportStructureMetadataToDesktop];
        
    }
    return self;
}

- (NSArray *)allStructures
{
    NSArray *allStructures = [[[[[@[]
                                  arrayByAddingObjectsFromArray:self.Nuclei]
                                 arrayByAddingObjectsFromArray:self.Tracts]
                                arrayByAddingObjectsFromArray:self.Arteries]
                               arrayByAddingObjectsFromArray:self.Miscellaneous]
                              arrayByAddingObjectsFromArray:self.CranialNerves];
    return allStructures;
}

- (NSArray *)getType:(BSStructureType)type inSection:(NSInteger)section
{
    NSArray *allOfType;
    
    switch (type) {
        case BSStructureTypeNucleus:
            allOfType = self.Nuclei;
            break;
        case BSStructureTypeTract:
            allOfType = self.Tracts;
            break;
        case BSStructureTypeArtery:
            allOfType = self.Arteries;
            break;
        case BSStructureTypeMiscellaneous:
            allOfType = self.Miscellaneous;
            break;
        case BSStructureTypeCranialNerve:
            allOfType = self.CranialNerves;
            break;
        default:
            NSLog(@"Error: error in first switch in getTypeInSection in model");
            break;
    }
    
    // Asking for all of them
    if (section == -1) {
        return allOfType;
        
    }
    // Asking for all in given section
    else{
        NSMutableArray *allOfTypeFromSection = [NSMutableArray new];
        
        if (type == BSStructureTypeArtery) {
            for (BSStructure *structure in allOfType) {
                if ([structure hasArteryInSectionNumber:section]) {
                    [allOfTypeFromSection addObject:structure];
                }
            }
        }else{
            for (BSStructure *structure in allOfType) {
                if ([structure structurePathInSection:section]) {
                    [allOfTypeFromSection addObject:structure];
                }
            }
        }
        return allOfTypeFromSection;
    }
}

- (BOOL)isFirstLaunch
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"hasLaunched"]){
        return YES;
    }
    return NO;
}

+ (void)exportPathDataForStructure:(BSStructure *)structure
{
    // Used to dump .json of the paths for each structure in each section
    // The "path-json" folder must exsist on the desktop already
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // Put in your whoami
    NSString *dataPath = [NSString stringWithFormat:@"/Users/%@/Desktop/path-json", @"Cam"];
    
    for (BSStructurePath *path in structure.structurePaths) {
        BOOL success = [fileManager createFileAtPath:[NSString stringWithFormat:@"%@/%@-%ld.json", dataPath, structure.conventionalName, (long)path.sectionNumber]
                                            contents:path.jsonData
                                          attributes:nil];
        if (!success) {
            NSLog(@"Failed to save %@", structure);
        }
    }
}

+ (NSString *)filepathForStructureType:(BSStructureType)structureType
{
    switch (structureType) {
        case BSStructureTypeNucleus:
            return [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"nuclei.plist"];
        case BSStructureTypeTract:
            return [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"tracts.plist"];
        case BSStructureTypeArtery:
            return [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"arteries.plist"];
        case BSStructureTypeMiscellaneous:
            return [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"miscellaneous.plist"];
        case BSStructureTypeCranialNerve:
            return [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"cranialnerves.plist"];
        default:
            break;
    }
}

- (void)exportStructureMetadataToDesktop
{
    NSString *dataPath;
    // Nuclei
    dataPath = @"/Users/Cam/Desktop/nuclei.plist";
    [HRCoder archiveRootObject:self.Nuclei toFile:dataPath];
    
    // Tracts
   dataPath = @"/Users/Cam/Desktop/tracts.plist";
    [HRCoder archiveRootObject:self.Tracts toFile:dataPath];
    
    // Arteries
    dataPath = @"/Users/Cam/Desktop/arteries.plist";
    [HRCoder archiveRootObject:self.Arteries toFile:dataPath];
    
    // Miscellaneous
    dataPath = @"/Users/Cam/Desktop/miscellaneous.plist";
    [HRCoder archiveRootObject:self.Miscellaneous toFile:dataPath];
    
    // CranialNerves
    dataPath = @"/Users/Cam/Desktop/cranialnerves.plist";
    [HRCoder archiveRootObject:self.CranialNerves toFile:dataPath];
    
    // TODO : Implement NSCoding on BSSyndrome and BSDeficit so we can export and serialize them!
    // ****** Syndromes *******
//    dataPath = @"/Users/Cam/Desktop/syndromes.plist";
//    [HRCoder archiveRootObject:self.Syndromes toFile:dataPath];
}

@end
