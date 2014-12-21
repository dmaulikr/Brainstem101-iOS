//
//  BSDeficit.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/1/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//


@interface BSDeficit : NSObject

@property (strong, nonatomic) NSString *symptoms;
@property (strong, nonatomic) NSString *deficit;

- (instancetype)initWithSymptoms:(NSString *)sym andDeficit:(NSString *)def;

@end
