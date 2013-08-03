//
//  BSQuizView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/15/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

@interface BSQuizView : UIView

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) IBOutlet UIImageView *forgroundImageView;

@property (nonatomic, strong) IBOutlet UITextField *answerBoxView;

-(void) loadQuestionFromDictionary:(NSDictionary *) dict;
-(void) showAnswer;

@end
