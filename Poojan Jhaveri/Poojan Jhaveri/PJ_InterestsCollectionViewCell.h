//
//  PJ_InterestsCollectionViewCell.h
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/13/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJ_HomeCollectionViewCell.h"

@interface PJ_InterestsCollectionViewCell : UICollectionViewCell<UICollisionBehaviorDelegate>

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIView *displayView;
-(void)FormatView;
@property (nonatomic, weak) id <CollectionCellDelegate> delegate;


@end
