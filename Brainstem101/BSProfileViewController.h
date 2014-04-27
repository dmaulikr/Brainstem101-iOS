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
#import "BSDetailsView.h"
#import "BSTutorialImageView.h"

@interface BSProfileViewController : UIViewController <UIGestureRecognizerDelegate, BSTutorialImageViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong, nonatomic) IBOutlet BSProfileSectionView *sectionView;
@property (strong, nonatomic) IBOutlet BSDetailsView *detailView;
@property (assign, nonatomic) int sectionNumber;

- (void)didSelectStructure:(BSStructure *) str;
- (IBAction)handleRotation:(id)sender;
- (IBAction)handeSwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)goBackToAtlas:(id)sender;

@end
