//
//  BSModel.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/12/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSModel.h"



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
        //tutorial logic
        self.inTutorialMode = NO;
        self.hasSeenFuckometer = NO;
        
        BSStructureGenerator *structuresObject = [[BSStructureGenerator alloc] init];
        self.Nuclei         = [structuresObject Nuclei];
        self.Tracts         = [structuresObject Tracts];
        self.Arteries       = [structuresObject Arteries];
        self.Miscellaneous  = [structuresObject Miscellaneous];
        self.CranialNerves  = [structuresObject CranialNerves];
        
    }
    return self;
}

- (NSArray *)Syndromes
{
    if (!_Syndromes) {
        _Syndromes = [BSSyndromeGenerator Syndromes];
    }
    return _Syndromes;
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
        NSLog(@"first launch");
        return YES;
    }
    return NO;
}

@end
