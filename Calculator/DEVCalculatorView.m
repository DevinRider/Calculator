//
//  DEVCalculatorView.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//



//THINGS THAT MUST BE ADDED/FIXED
//1. Buttons currently don't do anything. Need to add functionality to call a
//DEVCalculator calculateWithOperation:(whatever operation is on the button) number: [numberDisplay.text floatValue]


#import "DEVCalculatorView.h"

@implementation DEVCalculatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        
    }
    return self;
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
