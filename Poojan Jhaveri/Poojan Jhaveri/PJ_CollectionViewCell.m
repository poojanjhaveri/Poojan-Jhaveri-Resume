//
//  PJ_CollectionViewCell.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/11/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_CollectionViewCell.h"

@interface PJ_CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *helloWorld;


@end

@implementation PJ_CollectionViewCell

-(void)FormatView
{
    self.displayView.layer.cornerRadius = 5;
    [self.helloWorld setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
            self.layer.shadowOffset = CGSizeMake(0, -2);
           self.layer.shadowOpacity = 0.5f;
            self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
    
    self.clipsToBounds = NO;
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanning:)];
    [self addGestureRecognizer:gestureRecognizer];
    
}


-(void)performPanning:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"Panning started");
    
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x,
                                          translation.y + recognizer.view.center.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([self.delegate respondsToSelector:@selector(CellDidPan:atIndexPath:)]) {
            [self.delegate CellDidPan:self atIndexPath:self.indexPath];
        }
    }

}

@end
