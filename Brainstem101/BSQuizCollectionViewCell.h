//
//  BSQuizCollectionViewCell.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSQuizCollectionViewCell : UICollectionViewCell<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIImageView *foreground;
@property (weak, nonatomic) IBOutlet UITextField *answerBox;

-(void)receivedTap:(UIGestureRecognizer *)recognizer;

@end
