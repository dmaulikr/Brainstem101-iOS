//
//  BSQuestionGenerator.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSQuestionGenerator : NSObject

@property (nonatomic, strong) NSMutableArray *questions;

-(NSDictionary *)getNextQuestion;

@end
