//
//  PJ_CollectionViewLayout.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/11/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_CollectionViewLayout.h"
#import "PJ_CollectionViewCell.h"

static const NSUInteger ANDYBelowCellOffset = 25;
static const NSUInteger ANDYBelowCellHeight = 7;
static const CGFloat ANDYScaleFactor = 0.015f;


@implementation PJ_CollectionViewLayout

- (CGSize)collectionViewContentSize
{
    return self.collectionView.bounds.size;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    NSArray *visibleIndexPaths = [self indexPathOfItemsInRect:rect];
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    [self applyLayoutAttributes:layoutAttributes];
    return layoutAttributes;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)attributes
{
    DetailViewState cardState = [self.dataSource cardStateAtIndexPath:attributes.indexPath];
    
    switch (cardState) {
        case DetailViewStateNormal: {
            attributes.frame = [self frameForIndexPath:attributes.indexPath withOffset:attributes.indexPath.row andHeight:self.actualCellHeight];
        } break;
        case DetailViewStateSelected: {
            attributes.frame = [self frameForIndexPath:attributes.indexPath withOffset:0 andHeight:self.actualCellHeight];
        } break;
        case DetailViewStateCollapsed: {
            [self applyCollapsedAttributes:attributes];
        } break;
        default: break;
    }
}

- (void)applyCollapsedAttributes:(UICollectionViewLayoutAttributes *)attributes
{
    NSIndexPath *indexPath = attributes.indexPath;
    NSUInteger rowCount = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:indexPath.section];
    attributes.frame = [self frameForIndexPath:indexPath withOffset:indexPath.row andHeight:50.0f];
    CATransform3D transform = attributes.transform3D;
    CGFloat yTarget = CGRectGetHeight(self.collectionView.bounds) - ANDYBelowCellOffset + (ANDYBelowCellHeight * indexPath.row);
    CGFloat yOffset = yTarget - CGRectGetMinY(attributes.frame);
    transform = CATransform3DTranslate(transform, 0.0f, yOffset, 0.0f);
    transform = CATransform3DScale(transform, 1 - ((rowCount - indexPath.row) * ANDYScaleFactor), 1.0f, 1.0f);
    attributes.transform3D = transform;
}

- (NSArray *)indexPathOfItemsInRect:(CGRect)rect
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSUInteger sections = [self.collectionView numberOfSections];
    for (NSUInteger section = 0; section < sections; section++) {
        for (NSUInteger row = 0; row < [self.collectionView numberOfItemsInSection:section]; row++) {
            [indexPaths addObject:[NSIndexPath indexPathForItem:row inSection:section]];
        }
    }
    return indexPaths;
}

- (CGRect)frameForIndexPath:(NSIndexPath *)indexPath withOffset:(NSUInteger)offset andHeight:(CGFloat)height
{
    return CGRectMake(0.0f, self.visibleCellHeight * offset, self.collectionView.bounds.size.width, height);
}


@end
