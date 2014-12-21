//
//  BSProfileViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 12/18/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "BSDrawModeViewController.h"
#import "BSProfileSectionView.h"
#import "BSSection.h"
#import "BSStructure.h"
#import "BSStructurePath.h"
#import "BSTutorialImageView.h"

@interface BSProfileViewController : UIViewController <UIGestureRecognizerDelegate, BSTutorialImageViewDelegate, BSProfileSectionViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong, nonatomic) IBOutlet BSProfileSectionView *sectionView;
@property (strong, nonatomic) IBOutlet UILabel *structureNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *structureDetailView;
@property (assign, nonatomic) NSInteger sectionNumber;

- (IBAction)handleRotation:(id)sender;
- (IBAction)handeSwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)goBackToAtlas:(id)sender;

@end
