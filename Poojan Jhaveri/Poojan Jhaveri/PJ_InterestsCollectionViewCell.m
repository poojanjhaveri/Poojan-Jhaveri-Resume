//
//  PJ_InterestsCollectionViewCell.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/13/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_InterestsCollectionViewCell.h"
#import "PJ_CustomLabel.h"


@interface PJ_InterestsCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *myprecious;
@property (weak, nonatomic) IBOutlet UILabel *interestTitle;
@property (weak, nonatomic) IBOutlet PJ_CustomLabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;

@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *labela;
@property (weak, nonatomic) IBOutlet UILabel *labelb;
@property (weak, nonatomic) IBOutlet UILabel *labelc;
@property (weak, nonatomic) IBOutlet UILabel *labeld;
@property (weak, nonatomic) IBOutlet UILabel *labele;
@property (weak, nonatomic) IBOutlet UILabel *labelf;
@property (weak, nonatomic) IBOutlet UILabel *labelg;
@property (weak, nonatomic) IBOutlet UILabel *labelh;
@property (weak, nonatomic) IBOutlet UILabel *labeli;

@property UIDynamicAnimator* animator;
@property UIGravityBehavior* gravity;
@property UICollisionBehavior* collision;
@property UIPushBehavior* pusher1;
@property UIPushBehavior* pusher2;
@end

@implementation PJ_InterestsCollectionViewCell

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
   
    [self.interestTitle setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    self.displayView.layer.cornerRadius = 5;
    //  [self.helloWorld setFont:[UIFont fontWithName:@"Pacifico" size:30.0f]];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowOpacity = 0.5f;

    self.clipsToBounds = NO;
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanning:)];
    [self addGestureRecognizer:gestureRecognizer];
  
  
    
    self.animator= [[UIDynamicAnimator alloc] initWithReferenceView:self.displayView];
   
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.label1,self.label2,self.label3,self.label4,self.label5,self.label6,self.label7,self.label8,self.label9,self.label10,self.label11,self.label12,self.label13,self.labela,self.labelb,self.labelc,self.labeld,self.labele,self.labelf,self.labelg,self.labelh,self.labeli]];
    
  
   
    
}

-(IBAction)fightButtonPressed:(id)sender
{
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[self.label1,self.label2,self.label3,self.label4,self.label5,self.label6,self.label7,self.label8,self.label9,self.label10,self.label11,self.label12,self.label13,self.labela,self.labelb,self.labelc,self.labeld,self.labele,self.labelf,self.labelg,self.labelh,self.labeli]];
    itemBehaviour.elasticity = 0.5;
    itemBehaviour.allowsRotation=YES;
    itemBehaviour.friction=0;
    itemBehaviour.angularResistance=300;

    [_animator addBehavior:itemBehaviour];
    
    
    self.pusher1 = [[UIPushBehavior alloc] initWithItems:@[self.label1,self.label2,self.label3,self.label4,self.label5,self.label6,self.label7,self.label8,self.label9,self.label10,self.label11,self.label12,self.label13]
                                                   mode:UIPushBehaviorModeInstantaneous];
    self.pusher1.pushDirection = CGVectorMake(1, 0.5);
    self.pusher1.active = YES;
    
    
    self.pusher2 = [[UIPushBehavior alloc] initWithItems:@[self.labela,self.labelb,self.labelc,self.labeld,self.labele,self.labelf,self.labelg,self.labelh,self.labeli]
                                                    mode:UIPushBehaviorModeInstantaneous];
    self.pusher2.pushDirection = CGVectorMake(-1, -0.5);
    self.pusher2.active = YES;



    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.label1,self.label2,self.label3,self.label4,self.label5,self.label6,self.label7,self.label8,self.label9,self.label10,self.label11,self.label12,self.label13,self.labela,self.labelb,self.labelc,self.labeld,self.labele,self.labelf,self.labelg,self.labelh,self.labeli]];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    self.collision.collisionMode = UICollisionBehaviorModeEverything;
    self.collision.collisionDelegate = self;
    
    
     [self.animator addBehavior:_collision];
     [self.animator addBehavior:self.pusher1];
    [self.animator addBehavior:self.pusher2];
   
    
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {

    for (UIView *subView in self.displayView.subviews) {
       if([subView isKindOfClass:[PJ_CustomLabel class]])
       {
           PJ_CustomLabel *x=(PJ_CustomLabel *)subView;
           [x stopAnimating];
       }
        
    }
    
    self.myprecious.hidden=NO;
    UILabel* lbl = (UILabel*)item;
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; 
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    
    lbl.backgroundColor=color;
    [self.animator addBehavior:self.gravity];
    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
