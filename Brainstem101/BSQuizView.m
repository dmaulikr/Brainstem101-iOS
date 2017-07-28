//
//  BSQuizView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/15/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuizView.h"

@implementation BSQuizView
{
    NSDictionary *currentQuestion;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self.answerBoxView setBackgroundColor:[UIColor clearColor]];
    [self.answerBoxView setText:nil];
}

-(void)loadQuestionFromDictionary:(NSDictionary *) dict
{
    currentQuestion = dict;
    [self.answerBoxView setText:@""];
    [self.backgroundImageView setImage:[UIImage imageNamed:currentQuestion[@"background"]]];
    [self.forgroundImageView setImage:[UIImage imageNamed:currentQuestion[@"image"]]];
}

-(void)showAnswer
{
    [self.answerBoxView setText:currentQuestion[@"answer"]];
}

@end
