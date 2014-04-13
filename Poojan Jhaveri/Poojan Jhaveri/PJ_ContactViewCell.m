//
//  PJ_ContactViewCell.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/12/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_ContactViewCell.h"
#import "PJ_simplenavViewController.h"

@interface PJ_ContactViewCell ()

@property(weak,nonatomic) IBOutlet UILabel *contactTitle;
@end


@implementation PJ_ContactViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)FormatView
{
    [self.contactTitle setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    self.displayView.layer.cornerRadius = 5;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
    
    self.clipsToBounds = NO;
    
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanning:)];
   // [self addGestureRecognizer:gestureRecognizer];
    
}


-(void)performPanning:(UIPanGestureRecognizer *)recognizer
{
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
