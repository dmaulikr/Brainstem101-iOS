    //
    //  BSDetailsView.m
    //  Brainstem101
    //
    //  Created by Cameron Ehrlich on 12/6/12.
    //  Copyright (c) 2012 Brainstem101. All rights reserved.
    //

#import "BSDetailsView.h"

@implementation BSDetailsView

-(void)awakeFromNib{
    [_collectionView setContentInset:UIEdgeInsetsMake(5, 15, 0, 0)];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"Cell";
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell setClipsToBounds:NO];
    
    CGRect newFrame = cell.bounds;
    
    UITextView *textView;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:newFrame];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    switch (indexPath.row) {
        case 1:
            [imageView setImage:[UIImage imageNamed:_data[@"image"]]];
            [cell setBackgroundView:imageView];
            break;
        case 0:
            // could apply center thing here too from clinical description view, key value observing
            textView = [[UITextView alloc] initWithFrame:newFrame];
            [textView setBackgroundColor:[UIColor clearColor]];
            [textView setText:_data[@"description"]];
            [textView setTextColor:[UIColor whiteColor]];
            [textView setFont:[UIFont fontWithName:@"American Typewriter" size:18]];
            
            [cell setBackgroundView:textView];
            break;
        default:
            [textView setText:nil];
            [imageView setImage:nil];
            break;
    }
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize newSize = self.collectionView.bounds.size;
    newSize.height = newSize.height/2;
    newSize.width -= 60;
    return newSize;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

@end

