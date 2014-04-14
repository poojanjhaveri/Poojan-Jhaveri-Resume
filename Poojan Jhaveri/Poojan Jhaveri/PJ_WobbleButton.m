//
//  PJ_WobbleButton.m
//  Poojan Jhaveri
//
//  Created by Poojan Jhaveri on 4/13/14.
//  Copyright (c) 2014 Poojan Jhaveri. All rights reserved.
//

#import "PJ_WobbleButton.h"
#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@implementation PJ_WobbleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      
        
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
       
    }
    return self;
}

-(void)awakeFromNib
{
    
    self.layer.shadowColor = [UIColor yellowColor].CGColor;
    self.layer.shadowRadius = 10.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.shadowOffset = CGSizeZero;
    
    self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-10));
    
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse)
                     animations:^ {
                         self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5));
                     }
                     completion:NULL
     ];

    

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
