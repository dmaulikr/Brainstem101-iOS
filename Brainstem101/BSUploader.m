//
//  BSUploadStructure.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/14/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSUploader.h"

//NSString *apiUrl = @"http://localhost:3000/api/";
NSString *apiUrl = @"http://arcane-hamlet-4929.herokuapp.com/api/";

@implementation BSUploader

+ (void) uploadAllFromModel{
    for (BSStructure *structure in [[BSModel sharedModel] Nuclei]) {
        [BSUploader uploadStructure:structure];
    }
    for (BSStructure *structure in [[BSModel sharedModel] Tracts]) {
        [BSUploader uploadStructure:structure];
    }
    for (BSStructure *structure in [[BSModel sharedModel] Arteries]) {
        [BSUploader uploadStructure:structure];
    }
    for (BSStructure *structure in [[BSModel sharedModel] Miscellaneous]) {
        [BSUploader uploadStructure:structure];
    }
    for (BSStructure *structure in [[BSModel sharedModel] CranialNerves]) {
        [BSUploader uploadStructure:structure];
    }
    
    // Syndromes
    for (BSSyndrome *syndrome in [[BSModel sharedModel] Syndromes]) {
        [BSUploader uploadSyndrome:syndrome];
    }
}

+ (void) uploadStructure:(BSStructure *) structure {
    //escape strings to prepare for request params
    NSString *structureName = [structure.structureName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSString *structureDescription;
    if (structure.structureDescription == nil) {
       structureDescription = @"";
    }else{
        structureDescription = [structure.structureDescription stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }

    int structureType = structure.structureType;
    
    NSString *urlString = [NSString stringWithFormat:@"%@structure?structure_name=%@&structure_description=%@&structure_type=%d", apiUrl, structureName, structureDescription, structureType];
    
    NSURL *urlObject = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlObject];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Structure response: %@", JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@", error);
    }];
    
    [operation start];
}


+ (void) uploadSyndrome:(BSSyndrome *) syndrome{
        
    NSString *name = [syndrome name];
    NSString *description;
    if (syndrome.description == nil) {
        description = @"";
    }else{
        description = [syndrome description];
    }
    
    NSMutableArray *deficitArray = [NSMutableArray new];
    for (BSDeficit *deficit in [syndrome deficits]) {
        [deficitArray addObject:@{@"deficit":deficit.deficit, @"symptoms":deficit.symptoms}];
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deficitArray options:0 error:&error];
    NSString *deficitJSONString;
    if (error) {
        NSLog(@"Got an error: %@", error);
    }else{
        deficitJSONString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSString *urlString = [[NSString stringWithFormat:@"%@syndrome?name=%@&description=%@&deficits=%@", apiUrl, name, description, deficitJSONString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *urlObject = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlObject];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Syndrome response: %@", JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@", error);
    }];
    
    [operation start];
}

@end
