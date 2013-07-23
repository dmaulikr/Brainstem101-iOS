//
//  BSQuestionGenerator.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuestionGenerator.h"

@implementation BSQuestionGenerator{
    int currentQuestionIndex;
}
- (id)init
{
    self = [super init];
    if (self) {
        _questions = [NSMutableArray new];
        [self addQuestion:@"How about this?" withAnswer:@"Trigeminal Nuclei" andBackground:@"caudal-medulla-background.png" andImageNamed:@"caudal-medulla-trigeminal-nuc.png"];
        [self addQuestion:@"What is this?" withAnswer:@"Pyramidal Decussation" andBackground:@"caudal-medulla-background.png" andImageNamed:@"caudal-medulla-pyramidal-decussation.png"];
        [self addQuestion:@"What syndrome will damage to this cause?" withAnswer:@"Weber's Syndrome" andBackground:@"midbrain-background.png" andImageNamed:@"midbrain-weber.png"];
        [self addQuestion:@"Do you know what this is?" withAnswer:@"The Dorsal Column" andBackground:@"lower-medulla-background.png" andImageNamed:@"lower-medulla-dorsal-column.png"];
        [self addQuestion:@"What is this structure?" withAnswer:@"Inferior Olivary Nucleus" andBackground:@"rostral-medulla-background.png" andImageNamed:@"rostral-medulla-inferior-olivary.png"];
        [self addQuestion:@"What will damage to this structure cause?" withAnswer:@"Locked-In Syndrome" andBackground:@"mid-pons-background.png" andImageNamed:@"mid-pons-locked-in.png"];
        [self addQuestion:@"What structure is this?" withAnswer:@"Cerebral Aqueduct" andBackground:@"rostral-pons-background.png" andImageNamed:@"rostral-pons-cerebral-aqueduct.png"];
    }
    return self;
}

-(void)addQuestion:(NSString *)question withAnswer:(NSString *)answer andBackground:(NSString *)background andImageNamed: (NSString *)  image{
    if (image == nil) {
        image = @"";
    }
    NSDictionary *dict = @{@"question": question, @"answer": answer, @"background" : background, @"image" : image};
    [_questions addObject:dict];
}

-(NSDictionary *)getNextQuestion{
    currentQuestionIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentQuestionIndex"];
    currentQuestionIndex++;
    [[NSUserDefaults standardUserDefaults] setInteger:currentQuestionIndex forKey:@"currentQuestionIndex"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return _questions[currentQuestionIndex % _questions.count];
}

@end
