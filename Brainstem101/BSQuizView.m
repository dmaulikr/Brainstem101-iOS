//
//  BSQuizView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/15/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuizView.h"

@implementation BSQuizView {
    NSDictionary *currentQuestion;
}

-(void)awakeFromNib{
    [self setBackgroundColor:[UIColor clearColor]];
    [_answerBoxView setBackgroundColor:[UIColor clearColor]];
    [_questionBoxView setBackgroundColor:[UIColor clearColor]];
}

-(void) loadQuestionFromDictionary:(NSDictionary *) dict{
    currentQuestion = dict;
    [_answerBoxView setText:@""];
    [_questionBoxView setText:currentQuestion[@"question"]];
    [_backgroundImageView setImage:[UIImage imageNamed:currentQuestion[@"background"]]];
    [_forgroundImageView setImage:[UIImage imageNamed:currentQuestion[@"image"]]];
}

-(void) showAnswer{
    [_answerBoxView setText:currentQuestion[@"answer"]];
}

@end
