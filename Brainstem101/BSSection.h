//
//  BSSection.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSSection : NSObject

@property (assign) int sectionNumber;
@property (strong, nonatomic) UIImage *image;

- (id)initWithSectionNumber:(int) number;

- (UIImage *) atlasImage;
- (UIImage *) profileImage;

+ (BSSection *) atlasSectionNumber:(int)num;
+ (BSSection *) profileSectionNumber:(int)num;

@end
