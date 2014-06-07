//
//  DEVCalculatorViewController.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import "DEVCalculatorViewController.h"
#import "DEVCalculator.h"
#import <QuartzCore/QuartzCore.h>


@interface DEVCalculatorViewController () <DEVCalculatorDelegate>

@property (nonatomic) DEVCalculator *calculator;
@property UILabel *numberDisplay;
@property NSMutableArray *calcButtons;

@end

@implementation DEVCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.calculator = [[DEVCalculator alloc] init];
        self.calcButtons = [[NSMutableArray alloc] init];
        self.calculator.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:frame];
    
    //two floats to store the height of each row(or individual button)/width of the frame...mainly just for ease of reading the code
    //buttonHeight is the height of the whole frame / 5 because there are 5 rows
    float buttonHeight = frame.size.height / 6.0;
    float frameWidth = frame.size.width;
    
    //decided to add a "rowWidth" variable since it will be used quite a bit. 4 buttons across means the frameWidth / 4. Again, easier reading
    float buttonWidth = frameWidth / 4.0;
    
    //the top row of the calc will be a UILabel that shows the current number. Will take up 1/5 of the screen
    self.numberDisplay = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth, buttonHeight)];
    self.numberDisplay.textAlignment = NSTextAlignmentRight;
    self.numberDisplay.textColor = [UIColor whiteColor];
    self.numberDisplay.font = [UIFont systemFontOfSize:65];
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f", self.calculator.inactiveNumber];
    [self.view addSubview:self.numberDisplay];
    
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0, buttonHeight, buttonWidth, buttonHeight)];
    clearButton.tag = 3;
    [clearButton setTitle:@"C"
                 forState:UIControlStateNormal];
    [clearButton addTarget:self.calculator
                    action:@selector(clear)
          forControlEvents:UIControlEventTouchUpInside];
    [self.calcButtons addObject:clearButton];
    
    UIButton *changeSignButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
    changeSignButton.tag = 3;
    [changeSignButton setTitle:@"+/-"
                 forState:UIControlStateNormal];
    [changeSignButton addTarget:self.calculator
                         action:@selector(changeSign)
               forControlEvents:UIControlEventTouchUpInside];
    [self.calcButtons addObject:changeSignButton];

    
    UIButton *percentageButton = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
    percentageButton.tag = 3;
    [percentageButton setTitle:@"%"
                      forState:UIControlStateNormal];
    [percentageButton addTarget:self.calculator
                         action:@selector(makePercentage)
               forControlEvents:UIControlEventTouchUpInside];
    [self.calcButtons addObject:percentageButton];
    
    UIButton *sevenNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 2 * buttonHeight, buttonWidth, buttonHeight)];
    sevenNumber.tag = 1;
    [sevenNumber setTitle:@"7"
                 forState:UIControlStateNormal];
    [self.calcButtons addObject:sevenNumber];
    
    UIButton *eightNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
    eightNumber.tag = 1;
    [eightNumber setTitle:@"8"
                 forState:UIControlStateNormal];
    [self.calcButtons addObject:eightNumber];
    
    UIButton *nineNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
    nineNumber.tag = 1;
    [nineNumber setTitle:@"9"
                forState:UIControlStateNormal];
    [self.calcButtons addObject:nineNumber];
    
    UIButton *plusButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth,  buttonHeight, buttonWidth, buttonHeight)];
    plusButton.tag = 2;
    [plusButton setTitle:@"+"
                forState:UIControlStateNormal];
    [self.calcButtons addObject:plusButton];
    
    //next row of buttons
    UIButton *fourNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 3 * buttonHeight, buttonWidth, buttonHeight)];
    fourNumber.tag = 1;
    [fourNumber setTitle:@"4"
                forState:UIControlStateNormal];
    [self.calcButtons addObject:fourNumber];
    
    UIButton *fiveNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
    fiveNumber.tag = 1;
    [fiveNumber setTitle:@"5"
                forState:UIControlStateNormal];
    [self.calcButtons addObject:fiveNumber];
    
    UIButton *sixNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
    sixNumber.tag = 1;
    [sixNumber setTitle:@"6"
               forState:UIControlStateNormal];
    [self.calcButtons addObject:sixNumber];
    
    UIButton *minusButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
    minusButton.tag = 2;
    [minusButton setTitle:@"-"
                 forState:UIControlStateNormal];
    [self.calcButtons addObject:minusButton];
    
    //next row of buttons
    UIButton *oneNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 4 * buttonHeight, buttonWidth, buttonHeight)];
    oneNumber.tag = 1;
    [oneNumber setTitle:@"1"
               forState:UIControlStateNormal];
    [self.calcButtons addObject:oneNumber];
    
    UIButton *twoNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
    twoNumber.tag = 1;
    [twoNumber setTitle:@"2"
               forState:UIControlStateNormal];
    [self.calcButtons addObject:twoNumber];
    
    UIButton *threeNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
    threeNumber.tag = 1;
    [threeNumber setTitle:@"3"
                 forState:UIControlStateNormal];
    [self.calcButtons addObject:threeNumber];
    
    UIButton *multiplyButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
    multiplyButton.tag = 2;
    [multiplyButton setTitle:@"x"
                    forState:UIControlStateNormal];
    [self.calcButtons addObject:multiplyButton];
    
    //last row of buttons
    UIButton *zeroNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 5 * buttonHeight, 2 * buttonWidth, buttonHeight)];
    zeroNumber.tag = 1;
    [zeroNumber setTitle:@"0"
                forState:UIControlStateNormal];
    [self.calcButtons addObject:zeroNumber];
    
    UIButton *decimalButton = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 5 * buttonHeight, buttonWidth, buttonHeight)];
    decimalButton.tag = 3;
    [decimalButton setTitle:@"."
                   forState:UIControlStateNormal];
    [self.calcButtons addObject:decimalButton];
    
    UIButton *equalsButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 5 * buttonHeight, buttonWidth, buttonHeight)];
    equalsButton.tag = 2;
    [equalsButton setTitle:@"="
                  forState:UIControlStateNormal];
    [self.calcButtons addObject:equalsButton];
    
    UIButton *divisionButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
    divisionButton.tag = 2;
    [divisionButton setTitle:@"÷"
                    forState:UIControlStateNormal];
    [self.calcButtons addObject:divisionButton];

    NSLog(@"%@", self.calcButtons);
    for(UIButton* button in self.calcButtons)
    {
        //I use tags to denote what kind of button each is. A tag of "1" means it is a number button. A tag of "2" means it is an operation/equals.
        //A tag of "3" means it is another type of button.
        if (button.tag == 1) {
            button.backgroundColor = [UIColor lightGrayColor];
            [button addTarget:self
                       action:@selector(addDigit:)
             forControlEvents:UIControlEventTouchUpInside];
        }
        else if(button.tag == 2){
            button.backgroundColor = [UIColor orangeColor];
            if(![button.titleLabel.text isEqualToString:@"="]){
               [button addTarget:self
                            action:@selector(setOperand:)
                  forControlEvents:UIControlEventTouchUpInside];
            }
            else{
                [button addTarget:self.calculator
                           action:@selector(calculate)
                 forControlEvents:UIControlEventTouchUpInside];
            }
        }
        else if(button.tag == 3){
            button.backgroundColor = [UIColor darkGrayColor];
            //do things that other buttons need. Probably just going to be setting the color/color change on press.
        }
        
        [[button layer] setBorderWidth:0.5f];
        
        [self.view addSubview:button];
    }
}

- (void)loadView
{
    
}

- (void)addDigit:(id)sender
{
    UIButton *button = (UIButton *) sender;
    [self.calculator addDigit:[button.titleLabel.text integerValue]];
}

- (void)setOperand:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    if([buttonPressed.titleLabel.text isEqualToString:@"+"]){
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationAdd];
    }
    else if([buttonPressed.titleLabel.text isEqualToString:@"-"]){
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationSubtract];
    }
    else if([buttonPressed.titleLabel.text isEqualToString:@"x"]){
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationMultiply];
    }
    if([buttonPressed.titleLabel.text isEqualToString:@"÷"]){
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationDivide];
    }
}

- (void)digitDisplayChange
{
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f", self.calculator.activeNumber];
}

- (void)didCalculateWithResult
{
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f", self.calculator.inactiveNumber];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
