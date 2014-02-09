//
//  BSQuizViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/11/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSQuestionGenerator.h"
#import "BSQuizQuestion.h"
#import "BSTutorialImageView.h"


@interface BSQuizViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, BSTutorialImageViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)backAction:(id)sender;

@end
