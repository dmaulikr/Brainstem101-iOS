//
//  BSQuizQuestion.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSQuizQuestion : NSObject

@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSString *backgroundImageName;
@property (nonatomic, strong) NSString *foregroundImageName;

@end
