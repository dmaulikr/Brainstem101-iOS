//
//  BSDrawModeViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/6/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSDrawModeViewController.h"

@implementation BSDrawModeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.hintButton addTarget:self action:@selector(hintButtonCallback:event:) forControlEvents:UIControlEventAllEvents];
    
    self.currentPaths = [NSMutableSet new];
    [self.sectionView setAlpha:0.5];
    [self switchToSectionNumber:self.sectionNumber];
}

- (void)switchToSectionNumber:(NSInteger)sectionNumber
{
    _sectionNumber = sectionNumber;
    [self.sectionView setNewSectionNumber:sectionNumber];
    
    [self.currentPaths removeAllObjects];
    

    
    NSArray *currentNuclei          = [[BSModel sharedModel] getType:BSStructureTypeNucleus inSection:self.sectionNumber];
    NSArray *currentTracts          = [[BSModel sharedModel] getType:BSStructureTypeTract inSection:self.sectionNumber];
    NSArray *currentMiscellaneous   = [[BSModel sharedModel] getType:BSStructureTypeMiscellaneous inSection:self.sectionNumber];
    NSArray *currentCranialNerves   = [[BSModel sharedModel] getType:BSStructureTypeCranialNerve inSection:self.sectionNumber];
    
    NSArray *allStructures = [[[[@[]
                                 arrayByAddingObjectsFromArray:currentNuclei]
                                arrayByAddingObjectsFromArray:currentTracts]
                               arrayByAddingObjectsFromArray:currentMiscellaneous]
                              arrayByAddingObjectsFromArray:currentCranialNerves];

    
    for (BSStructure *structure in allStructures) {
        [self.currentPaths addObject:[structure structurePathInSection:self.sectionNumber]];
    }
    
    
    // Hide the hint layer but begin the bacground drawing operation so its ready when they press hint
    [self.sectionView.pathLayer setHidden:YES];
    [self.sectionView drawPaths:[[self.currentPaths allObjects] mutableCopy]];

}

- (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [[UIScreen mainScreen] scale]);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - IBActions

- (IBAction)undo:(id)sender
{
    [self.drawView undo];
}

- (IBAction)clear:(id)sender
{
    [self.drawView clear];
}

- (IBAction)saveAsImage:(id)sender
{
    [[[UIAlertView alloc] initWithTitle:@"Saved!" message:@"Your drawing has been saved to your Photo Library." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil] show];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage *tmp = [self imageWithView:self.view];
        UIImageWriteToSavedPhotosAlbum(tmp, nil, nil, nil);
    });
}

- (void)hintButtonCallback:(UIButton *)sender event:(UIEvent *)event
{
    UITouch *touch = [event.allTouches anyObject];
    
    switch (touch.phase) {
        case UITouchPhaseBegan:
            [self.sectionView.pathLayer setHidden:NO];
            break;
        case UITouchPhaseMoved:
            //
            break;
        case UITouchPhaseStationary:
            //
            break;
        case UITouchPhaseEnded:
            [self.sectionView.pathLayer setHidden:YES];
            break;
        case UITouchPhaseCancelled:
            [self.sectionView.pathLayer setHidden:YES];
            break;
        default:
            break;
    }
}

- (IBAction)previousSectionAction:(id)sender
{
    [self clear:self];
    [self switchToSectionNumber:MAX(self.sectionNumber - 1, 0)];
}

- (IBAction)nextSectionAction:(id)sender
{
    [self clear:self];
    [self switchToSectionNumber:MIN(self.sectionNumber + 1, 8)];
}

#pragma mark Touch Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.drawView touchesBegan:touches withEvent:event];
    [self.drawView touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self.drawView touchesMoved:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self.drawView touchesCancelled:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.drawView touchesEnded:touches withEvent:event];
}

#pragma mark - System Methods

- (IBAction)goBackToProfile:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

@end
