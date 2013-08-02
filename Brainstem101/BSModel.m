//
//  BSModel.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/12/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSModel.h"

static BSModel *modelSingleton = nil;

@implementation BSModel

+ (id)sharedModel {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modelSingleton = [[self alloc] init];
    });
    return modelSingleton;
}

- (id)init {
    if (self = [super init]) {        
        //tutorial logic
        _inTutorialMode = NO;
        _hasSeenFuckometer = NO;
        
        BSStructureGenerator *structuresObject = [[BSStructureGenerator alloc] init];
        _Nuclei         = [structuresObject Nuclei];
        _Tracts         = [structuresObject Tracts];
        _Arteries       = [structuresObject Arteries];
        _Miscellaneous  = [structuresObject Miscellaneous];
        _CranialNerves  = [structuresObject CranialNerves];
        
    }
    return self;
}

-(NSArray *)Syndromes{
    if (!_Syndromes) {
        _Syndromes = [BSSyndromeGenerator Syndromes];
    }
    return _Syndromes;
}

-(NSArray *)getType:(BSStructureType)type inSection:(int)section{
    NSArray *tmpType;
    
    switch (type) {
        case BSStructureTypeNucleus:
            tmpType = _Nuclei;
            break;
        case BSStructureTypeTract:
            tmpType = _Tracts;
            break;
        case BSStructureTypeArtery:
            tmpType = _Arteries;
            break;
        case BSStructureTypeMiscellaneous:
            tmpType = _Miscellaneous;
            break;
        case BSStructureTypeCranialNerve:
            tmpType = _CranialNerves;
            break;
        default:
            tmpType = _Nuclei;
            NSLog(@"Error: error in first switch in getTypeInSection in model");
            break;
    }
    
    if (section == -1) { // asking for all of them
        return tmpType;
        
    }else{ //asking for all in given section
        NSMutableArray *tmpTypeInSection = [NSMutableArray new];

        if (type == BSStructureTypeArtery) {
            for (BSStructure* s in tmpType) {
                if ([s hasArteryInSectionNumber:section]) {
                    [tmpTypeInSection addObject:s];
                }
            }
        }else{
            for (BSStructure* s in tmpType) {
                if ([s isInSectionNumber:section]) {
                    [tmpTypeInSection addObject:s];
                }
            }
        }
        return tmpTypeInSection;
    }
}


- (BOOL) isFirstLaunch {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"hasLaunched"]){
        NSLog(@"first launch");
        return YES;
    }
    return NO;
}

@end
