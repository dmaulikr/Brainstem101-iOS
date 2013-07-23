//
//  BSDetailsView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 12/6/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

@interface BSDetailsView : UIView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
