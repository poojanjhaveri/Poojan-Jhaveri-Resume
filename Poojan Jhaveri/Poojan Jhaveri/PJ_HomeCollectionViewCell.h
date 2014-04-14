//
//  PJ_CollectionViewCell.h
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/11/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionCellDelegate;

@interface PJ_HomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (nonatomic, weak) id <CollectionCellDelegate> delegate;
-(void)FormatView;
@end

@protocol CollectionCellDelegate <NSObject>
- (void)PassDidPan:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end
