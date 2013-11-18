//
//  BSQuestionGenerator.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSQuizQuestion.h"

@interface BSQuestionGenerator : NSObject

+(NSArray *)questions;

+(BSQuizQuestion *)questionWithAnswer:(NSString *) answer foregroundImageName:(NSString *) foreground andBackgroundImageName:(NSString *) background;

@end
