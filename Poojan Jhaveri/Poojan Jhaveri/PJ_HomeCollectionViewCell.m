//
//  PJ_CollectionViewCell.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/11/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_HomeCollectionViewCell.h"

@interface PJ_HomeCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *helloWorld;
@property (weak, nonatomic) IBOutlet UILabel *nameTitle;


@end

@implementation PJ_HomeCollectionViewCell

-(void)FormatView
{
    self.displayView.layer.cornerRadius = 5;
    [self.helloWorld setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    [self.nameTitle setFont:[UIFont fontWithName:@"Pacifico" size:25.0f]];
    
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowOpacity = 0.5f;
    
    self.clipsToBounds = NO;
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanning:)];
    [self addGestureRecognizer:gestureRecognizer];
    
}


-(void)performPanning:(UIPanGestureRecognizer *)recognizer
{
//    NSLog(@"Panning started");
    
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

@end
