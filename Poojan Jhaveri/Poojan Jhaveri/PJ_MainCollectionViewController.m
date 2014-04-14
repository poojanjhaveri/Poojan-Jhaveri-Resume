//
//  PJ_MainCollectionViewController.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/11/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_MainCollectionViewController.h"
#import "PJ_HomeCollectionViewCell.h"
#import "PJ_CollectionViewLayout.h"
#import "PJ_EducationViewCell.h"
#import "PJ_ContactViewCell.h"



@interface PJ_MainCollectionViewController ()<CollectionCellDelegate, LayoutDataSource>
@property (nonatomic, strong) PJ_CollectionViewLayout *layout;
@property (nonatomic, strong) NSMutableArray *passcontrollers;
@end

@implementation PJ_MainCollectionViewController

- (instancetype)initWithCollectionViewLayout:(PJ_CollectionViewLayout *)layout
{
     self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _layout = layout;
        _layout.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   [self.collectionView registerClass:[PJ_CollectionViewCell class] forCellWithReuseIdentifier:[PJ_CollectionViewCell reusedIdentifier]];
    UINib *nib = [UINib nibWithNibName:@"Home" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Alpha"];
    
    UINib *nib2 = [UINib nibWithNibName:@"Education" bundle:nil];
    [self.collectionView registerNib:nib2 forCellWithReuseIdentifier:@"Education"];
    
    UINib *nib3 = [UINib nibWithNibName:@"Contact" bundle:nil];
    [self.collectionView registerNib:nib3 forCellWithReuseIdentifier:@"Contact"];
    
    UINib *nib4 = [UINib nibWithNibName:@"WorkExperience" bundle:nil];
    [self.collectionView registerNib:nib4 forCellWithReuseIdentifier:@"WorkExperience"];
    
    UINib *nib5 = [UINib nibWithNibName:@"Projects" bundle:nil];
    [self.collectionView registerNib:nib5 forCellWithReuseIdentifier:@"Projects"];
    
    UINib *nib6 = [UINib nibWithNibName:@"Interests" bundle:nil];
    [self.collectionView registerNib:nib6 forCellWithReuseIdentifier:@"Interests"];

    
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.passcontrollers count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PJ_HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Alpha" forIndexPath:indexPath];
    
    
    switch (indexPath.row) {
        case 0:
        {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Contact" forIndexPath:indexPath];
            break;
        }
        case 1:
        {
           
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Interests" forIndexPath:indexPath];
            break;
        }
        case 2:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Projects" forIndexPath:indexPath];
            break;
            
        case 3:
         
             cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WorkExperience" forIndexPath:indexPath];
            break;
            
        case 4:
             cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Education" forIndexPath:indexPath];
            break;
            
        case 5:
                break;
            
        default:
            break;
    }
    
    
   
    [cell FormatView];
    
    
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}

- (void)expandRows
{
    self.passcontrollers=nil;
}

- (void)collapseRows:(NSUInteger)selectedRow
{
    NSUInteger count = [self.passcontrollers count];
    NSMutableArray *cards = self.passcontrollers;
    for (NSUInteger index = 0; index < count; index++) {
        if (index == selectedRow) {
            cards[index] = @(DetailViewStateSelected);
        } else {
            cards[index] = @(DetailViewStateCollapsed);
        }
    }
}

- (void)PassDidPan:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [self animateSelectionAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self animateSelectionAtIndexPath:indexPath];
}

- (void)animateSelectionAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView performBatchUpdates:^{
        [self selectPassAtIndexPath:indexPath];
    } completion:nil];
    
    
    PJ_CollectionViewLayout *layout = (PJ_CollectionViewLayout *)self.collectionView.collectionViewLayout;
    [layout invalidateLayout];
}


- (void)selectPassAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewState cardState = [self passStateAtIndexPath:indexPath];
    
    switch (cardState) {
        case DetailViewStateNormal:
            [self collapseRows:indexPath.row];
            break;
        case DetailViewStateSelected:
        case DetailViewStateCollapsed:
            [self expandRows];
        default:
            break;
    }
}



- (DetailViewState)passStateAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *cards = self.passcontrollers;
    NSNumber *cardState = cards[indexPath.row];
    return [cardState intValue];
}


- (NSMutableArray *)passcontrollers
{
    if (_passcontrollers) {
        return _passcontrollers;
    }
    
    _passcontrollers = [[NSMutableArray alloc] initWithArray:
              @[ @(DetailViewStateNormal),
                 @(DetailViewStateNormal),
                 @(DetailViewStateNormal),
                 @(DetailViewStateNormal),
                 @(DetailViewStateNormal),
                 @(DetailViewStateNormal)]];
    
    return _passcontrollers;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
