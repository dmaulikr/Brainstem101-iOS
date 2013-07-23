//
//  BSTutorialImageView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/23/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

@protocol BSTutorialImageViewDelegate <NSObject>
@required
- (void) dissmissTutorialImageView:(id)tutorialView;
@end

@interface BSTutorialImageView : UIImageView

@property (weak, nonatomic) id <BSTutorialImageViewDelegate> delegate;
@property (strong, nonatomic) UIButton *exitButton;

+ (BSTutorialImageView *) page0Tutorial;
+ (BSTutorialImageView *) atlasTutorial;
+ (BSTutorialImageView *) clinicalTutorial;

@end

