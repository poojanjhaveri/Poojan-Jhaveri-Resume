//
//  PJ_WorkExperienceCollectionViewCell.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/12/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_WorkExperienceCollectionViewCell.h"
#import "PJ_EducationPageViewController.h"

@interface PJ_WorkExperienceCollectionViewCell ()
@property(strong,nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UILabel *workExperienceTitle;

@end


@implementation PJ_WorkExperienceCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [self initializePageViewController];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super initWithCoder:aDecoder])
    {
        
    }
    return self;
}

-(void)FormatView
{
    [self.workExperienceTitle setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    self.displayView.layer.cornerRadius = 5;
    //  [self.helloWorld setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowOpacity = 0.5f;
    
    self.clipsToBounds = NO;
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanning:)];
    [self addGestureRecognizer:gestureRecognizer];
    
}

-(void)initializePageViewController
{
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    
    [[self.pageViewController view] setFrame:CGRectMake(10, 65, 300, 400)];
    
    [self.pageViewController setDelegate:self];
    
    PJ_EducationPageViewController *initialViewController = [self viewControllerAtIndex:0];
    
    
    [self.displayView addSubview:self.pageViewController.view];
    
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
}




-(void)performPanning:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x,
                                         translation.y + recognizer.view.center.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([self.delegate respondsToSelector:@selector(PassDidPan:atIndexPath:)]) {
            [self.delegate PassDidPan:self atIndexPath:self.indexPath];
        }
    }
    
}

#pragma PageVieController

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(PJ_EducationPageViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(PJ_EducationPageViewController *)viewController index];
    
    
    index++;
    
    if (index == 4) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}


- (PJ_EducationPageViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    PJ_EducationPageViewController *childViewController;
    if(index==0)
    {
        childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TA_ITP"];
    }
    else if(index==1){
        
        childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Kokoche"];
    }
    else if(index==2){
        
        childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"devit"];
    }
    else {
        
        childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"youthconnect"];
    }
    
    

    childViewController.index = index;
    
    return childViewController;
    
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    
    return 4;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


@end
