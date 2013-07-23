//
//  BSDrawModeViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/6/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSDrawModeViewController.h"

@implementation BSDrawModeViewController{
    NSMutableArray *paths;
    int hintState;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    hintState = 0;
    paths = [NSMutableArray new];
    
    for (int i = 0; i < [[[BSModel sharedModel] Nuclei] count]; i++) {
        if ([[[BSModel sharedModel] Nuclei][i] isInSectionNumber:_sectionNumber]) {
            [paths addObject:[[[BSModel sharedModel] Nuclei][i] structurePaths][_sectionNumber]];
        }
    }
    
    for (int i = 0; i < [[[BSModel sharedModel] Tracts] count]; i++) {
        if ([[[BSModel sharedModel] Tracts][i] isInSectionNumber:_sectionNumber]) {
            [paths addObject:[[[BSModel sharedModel] Tracts][i] structurePaths][_sectionNumber]];            
        }
    }
    
    for (int i = 0; i < [[[BSModel sharedModel] Arteries] count]; i++) {
        if ([[[BSModel sharedModel] Arteries][i] isInSectionNumber:_sectionNumber]) {
            [paths addObject:[[[BSModel sharedModel] Arteries][i] structurePaths][_sectionNumber]];            
        }
    }
    
    for (int i = 0; i < [[[BSModel sharedModel] Miscellaneous] count]; i++) {
        if ([[[BSModel sharedModel] Miscellaneous][i] isInSectionNumber:_sectionNumber]) {
            [paths addObject:[[[BSModel sharedModel] Miscellaneous][i] structurePaths][_sectionNumber]];            
        }
    }
    
    for (int i = 0; i < [[[BSModel sharedModel] CranialNerves] count]; i++) {
        if ([[[BSModel sharedModel] CranialNerves][i] isInSectionNumber:_sectionNumber]) {
            //check if its been drawn before
            if (![paths containsObject:[[[BSModel sharedModel] CranialNerves][i] structurePaths][_sectionNumber]]) {
                [paths addObject:[[[BSModel sharedModel] CranialNerves][i] structurePaths][_sectionNumber]];
            }
        }
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [_sectionView setAlpha:0];
    [_sectionView setNewSectionNumber:_sectionNumber];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [_sectionView setAlpha:0.25];
    } completion:nil];
}

- (UIImage *)imageWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [[UIScreen mainScreen] scale]);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - IBActions

- (IBAction)undo:(id)sender {
    [_drawView undo];
}

- (IBAction)clear:(id)sender {
    [_drawView clear];
}

- (IBAction)saveAsImage:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *tmp = [self imageWithView:self.view];
        UIImageWriteToSavedPhotosAlbum(tmp, nil, nil, nil);
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@"Saved!" message:@"Your drawing has been saved to your Photo Library." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil] show];
        });
    });
}

- (IBAction)hintButtonAction:(UIButton *)sender {
    if (hintState % 2 == 0 ) {
        [_sectionView drawPathsForProfile:paths];
    }else{
        [_sectionView clearPaths];
    }
    hintState++;
}

#pragma mark Touch Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_drawView touchesBegan:touches withEvent:event];
    [_drawView touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [_drawView touchesMoved:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [_drawView touchesCancelled:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_drawView touchesEnded:touches withEvent:event];
}

#pragma mark - System Methods

- (IBAction)goBackToProfile:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Received Memory Warning!");
}


@end
