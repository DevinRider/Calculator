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
        
        //two floats to store the height of each row(or individual button)/width of the frame...mainly just for ease of reading the code
        //buttonHeight is the height of the whole frame / 5 because there are 5 rows
        float buttonHeight = frame.size.height / 5.0;
        float frameWidth = frame.size.width;
        
        //decided to add a "rowWidth" variable since it will be used quite a bit. 4 buttons across means the frameWidth / 4. Again, easier reading
        float buttonWidth = frameWidth / 4.0;
        
        //the top row of the calc will be a UILabel that shows the current number. Will take up 1/5 of the screen
        UILabel *numberDisplay = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth, buttonHeight)];
        numberDisplay.textAlignment = NSTextAlignmentRight;
        numberDisplay.textColor = [UIColor whiteColor];
        numberDisplay.font = [UIFont systemFontOfSize:75];
        [self addSubview:numberDisplay];
        
        //first (top) row of buttons
        UIButton *sevenNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, buttonHeight, buttonWidth, buttonHeight)];
        sevenNumber.backgroundColor = [UIColor grayColor];
        [sevenNumber setTitle:@"7"
                     forState:UIControlStateNormal];
        [self addSubview:sevenNumber];
        
        UIButton *eightNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
        eightNumber.backgroundColor = [UIColor grayColor];
        [eightNumber setTitle:@"8"
                     forState:UIControlStateNormal];
        [self addSubview:eightNumber];
        
        UIButton *nineNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
        nineNumber.backgroundColor = [UIColor grayColor];
        [nineNumber setTitle:@"9"
                     forState:UIControlStateNormal];
        [self addSubview:nineNumber];
        
        UIButton *plusButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
        plusButton.backgroundColor = [UIColor orangeColor];
        [plusButton setTitle:@"+"
                     forState:UIControlStateNormal];
        [self addSubview:plusButton];
        
        //next row of buttons
        UIButton *fourNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 2 * buttonHeight, buttonWidth, buttonHeight)];
        fourNumber.backgroundColor = [UIColor grayColor];
        [fourNumber setTitle:@"4"
                     forState:UIControlStateNormal];
        [self addSubview:fourNumber];
        
        UIButton *fiveNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
        fiveNumber.backgroundColor = [UIColor grayColor];
        [fiveNumber setTitle:@"5"
                     forState:UIControlStateNormal];
        [self addSubview:fiveNumber];
        
        UIButton *sixNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
        sixNumber.backgroundColor = [UIColor grayColor];
        [sixNumber setTitle:@"6"
                     forState:UIControlStateNormal];
        [self addSubview:sixNumber];
        
        UIButton *minusButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
        minusButton.backgroundColor = [UIColor orangeColor];
        [minusButton setTitle:@"-"
                     forState:UIControlStateNormal];
        [self addSubview:minusButton];

        //next row of buttons
        UIButton *oneNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 3 * buttonHeight, buttonWidth, buttonHeight)];
        oneNumber.backgroundColor = [UIColor grayColor];
        [oneNumber setTitle:@"1"
                     forState:UIControlStateNormal];
        [self addSubview:oneNumber];
        
        UIButton *twoNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
        twoNumber.backgroundColor = [UIColor grayColor];
        [twoNumber setTitle:@"2"
                     forState:UIControlStateNormal];
        [self addSubview:twoNumber];
        
        UIButton *threeNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
        threeNumber.backgroundColor = [UIColor grayColor];
        [threeNumber setTitle:@"3"
                     forState:UIControlStateNormal];
        [self addSubview:threeNumber];
        
        UIButton *multiplyButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
        multiplyButton.backgroundColor = [UIColor orangeColor];
        [multiplyButton setTitle:@"x"
                     forState:UIControlStateNormal];
        [self addSubview:multiplyButton];
        
        //last row of buttons
        UIButton *zeroNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 4 * buttonHeight, 2 * buttonWidth, buttonHeight)];
        zeroNumber.backgroundColor = [UIColor grayColor];
        [zeroNumber setTitle:@"0"
                     forState:UIControlStateNormal];
        [self addSubview:zeroNumber];
        
        UIButton *equalsButton = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
        equalsButton.backgroundColor = [UIColor orangeColor];
        [equalsButton setTitle:@"="
                     forState:UIControlStateNormal];
        [self addSubview:equalsButton];
        
        UIButton *divisionButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
        divisionButton.backgroundColor = [UIColor orangeColor];
        [divisionButton setTitle:@"÷"
                      forState:UIControlStateNormal];
        [self addSubview:divisionButton];
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
