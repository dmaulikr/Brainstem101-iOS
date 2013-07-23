//
//  BSDrawModeViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/6/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSSectionView.h"
#import "BSStructure.h"
#import "BSStructurePath.h"
#import "BSDetailsView.h"
#import "BSDrawView.h"

@interface BSDrawModeViewController : UIViewController

@property (strong, nonatomic) IBOutlet BSSectionView *sectionView;
@property (strong, nonatomic) IBOutlet BSDrawView *drawView;
@property (assign) int sectionNumber;

- (IBAction)goBackToProfile:(id)sender;
- (IBAction)undo:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)saveAsImage:(id)sender;
- (IBAction)hintButtonAction:(id)sender;

@end
