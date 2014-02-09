//
//  BSQuizViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/11/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuizViewController.h"
#import "BSQuizCollectionViewCell.h"

@implementation BSQuizViewController
{
    NSArray *questions;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    questions = [BSQuestionGenerator questions];
}

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewCellDelegate and Datasource

-(BSQuizCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"QuizCell";
    
    BSQuizCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    BSQuizQuestion *question = [questions objectAtIndex:indexPath.row];
    [cell.background setImage:[UIImage imageNamed:question.backgroundImageName]];
    [cell.foreground setImage:[UIImage imageNamed:question.foregroundImageName]];
    [cell.answerBox setText:question.answer];
    [cell.answerBox setHidden:YES];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:cell action:@selector(receivedTap:)];
    tapGesture.numberOfTouchesRequired = 1;
    [cell addGestureRecognizer:tapGesture];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return questions.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark System Methods
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
