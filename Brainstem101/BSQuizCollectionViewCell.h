//
//  BSQuizCollectionViewCell.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSQuizCollectionViewCell : UICollectionViewCell<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UITextField *answerBox;

@property (strong, nonatomic) UIImageView *foreground;

-(void)receivedTap:(UIGestureRecognizer *)recognizer;

@end
