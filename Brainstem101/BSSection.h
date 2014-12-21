//
//  BSSection.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSSection : NSObject

@property (assign, nonatomic) NSInteger sectionNumber;
@property (strong, nonatomic) UIImage *image;

- (instancetype)initWithSectionNumber:(NSInteger)number;

- (UIImage *)atlasImage;
- (UIImage *)profileImage;

+ (BSSection *)atlasSectionNumber:(NSInteger)num;
+ (BSSection *)profileSectionNumber:(NSInteger)num;

@end
