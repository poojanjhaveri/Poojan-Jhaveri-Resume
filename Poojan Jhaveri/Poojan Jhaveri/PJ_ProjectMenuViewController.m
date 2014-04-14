//
//  PJ_ProjectMenuViewController.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/13/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_ProjectMenuViewController.h"
#import "PJ_ProjectsCollectionViewCell.h"

@interface PJ_ProjectMenuViewController ()

@end

@implementation PJ_ProjectMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ISODOCButtonTouched:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/iso-documentation/id595012249?mt=8"]];
    
}

- (IBAction)isoTrainingButtonTouched:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/iso-training/id541857355?mt=8"]];
}

- (IBAction)navkarMantraButtonTouched:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/navkar-mantra/id550872466?mt=8"]];
    
}

- (IBAction)homeButtonTouched:(id)sender {
    
    UIPageViewController *x = (UIPageViewController *)self.parentViewController;
    
    NSArray *viewControllers = [NSArray arrayWithObject:[self viewControllerAtIndex:0]];
    
    [x setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    
}


- (IBAction)ButtonTouched:(id)sender {

    UIPageViewController *x = (UIPageViewController *)self.parentViewController;
    UIButton *btn = sender;
    
    NSArray *viewControllers = [NSArray arrayWithObject:[self viewControllerAtIndex:btn.tag]];
    
    [x setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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

@end
