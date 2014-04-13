//
//  PJ_CollectionViewLayout.h
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/11/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJ_MainCollectionViewController.h"

@protocol LayoutDataSource;


@interface PJ_CollectionViewLayout : UICollectionViewLayout

@property (nonatomic) NSUInteger visibleCellHeight;
@property (nonatomic) NSUInteger actualCellHeight;
@property (nonatomic, weak) id <LayoutDataSource> dataSource;
@end

@protocol LayoutDataSource <NSObject>
- (DetailViewState)cardStateAtIndexPath:(NSIndexPath *)indexPath;
@end
