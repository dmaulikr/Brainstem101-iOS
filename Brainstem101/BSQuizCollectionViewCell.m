//
//  BSQuizCollectionViewCell.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/17/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuizCollectionViewCell.h"

@implementation BSQuizCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.background.contentMode = UIViewContentModeScaleAspectFit;
    self.foreground = [[UIImageView alloc] initWithFrame:self.background.bounds];
    self.foreground.contentMode = UIViewContentModeScaleAspectFit;
    [self.background addSubview:self.foreground];
}


- (void)receivedTap:(UIGestureRecognizer *)recognizer
{
    [self.answerBox setHidden:!self.answerBox.isHidden];
}


@end
