//
//  PJ_ProjectsCollectionViewCell.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/13/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_ProjectsCollectionViewCell.h"
#import "PJ_EducationPageViewController.h"

@interface PJ_ProjectsCollectionViewCell ()
@property(strong,nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UILabel *projectTitle;

@end

@implementation PJ_ProjectsCollectionViewCell

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

-(void)FormatView
{
    [self.projectTitle setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
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
    
    [[self.pageViewController view] setFrame:CGRectMake(10, 65, 300, 380)];
    
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
    
    if (index == 9) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}


- (PJ_EducationPageViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    PJ_EducationPageViewController *childViewController;
    switch (index) {
        case 0:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProjectMenu"];
            break;
            
        case 1:
             childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ISO_DOC"];
            break;
            
            
        case 2:
             childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"navkar_mantra"];
            break;
            
            
        case 3:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"iso_training"];
            break;
            
        case 4:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"instagram"];
            break;
            
        case 5:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"symmetricity"];
            break;
            
            
        case 6:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"socialsearch"];
            break;
            
        case 7:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"duckhunt"];
            break;
            
        case 8:
            childViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"factory"];
            break;

            
        default:
            break;
    }
    
    
    
    
    childViewController.index = index;
    
    return childViewController;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
