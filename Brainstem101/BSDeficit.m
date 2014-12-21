//
//  BSDeficit.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/1/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSDeficit.h"

@implementation BSDeficit

- (instancetype)initWithSymptoms:(NSString *)sym andDeficit:(NSString *)def
{
    self = [super init];
    if (self) {
        _symptoms = sym;
        _deficit = def;
    }
    return self;
}

@end
