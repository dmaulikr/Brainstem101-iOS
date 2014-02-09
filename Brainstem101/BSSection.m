//
//  BSSection.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSSection.h"

@implementation BSSection


- (id)initWithSectionNumber:(int)number
{
    self = [super init];
    if (self) {
        self.sectionNumber = number;
    }
    return self;
}

+ (BSSection *)atlasSectionNumber:(int)num
{
    return [[BSSection alloc] initWithSectionNumber:num];
}

+ (BSSection *) profileSectionNumber:(int)num
{
    return [[BSSection alloc] initWithSectionNumber:num];
}

- (UIImage *)atlasImage
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"atlas-sxn-%d.png", _sectionNumber]];
}

- (UIImage *)profileImage
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"profile-sxn-%d.png", _sectionNumber]];
}

@end
