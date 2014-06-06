//
//  DEVCalculatorViewController.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import "DEVCalculatorViewController.h"
#import "DEVCalculator.h"

@interface DEVCalculatorViewController () <DEVCalculatorDelegate>

@property (nonatomic) DEVCalculator *calculator;
@property UILabel *numberDisplay;

@end

@implementation DEVCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.calculator = [[DEVCalculator alloc] init];
        self.calculator.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //this is ideally how I would like to set everything up. It's clean and easy to read but I am unsure where the connection between
    //the DEVCalculator and the DEVCalculatorView is to be made
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:frame];
    
    //two floats to store the height of each row(or individual button)/width of the frame...mainly just for ease of reading the code
    //buttonHeight is the height of the whole frame / 5 because there are 5 rows
    float buttonHeight = frame.size.height / 5.0;
    float frameWidth = frame.size.width;
    
    //decided to add a "rowWidth" variable since it will be used quite a bit. 4 buttons across means the frameWidth / 4. Again, easier reading
    float buttonWidth = frameWidth / 4.0;
    
    //the top row of the calc will be a UILabel that shows the current number. Will take up 1/5 of the screen
    self.numberDisplay = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth, buttonHeight)];
    self.numberDisplay.textAlignment = NSTextAlignmentRight;
    self.numberDisplay.textColor = [UIColor whiteColor];
    self.numberDisplay.font = [UIFont systemFontOfSize:75];
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f", self.calculator.inactiveNumber];
    [self.view addSubview:self.numberDisplay];
    
    //first (top) row of buttons
    UIButton *sevenNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, buttonHeight, buttonWidth, buttonHeight)];
    sevenNumber.backgroundColor = [UIColor grayColor];
    sevenNumber.tag = 7;
    [sevenNumber setTitle:@"7"
                 forState:UIControlStateNormal];
    [sevenNumber addTarget:self
                    action:@selector(addDigit:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sevenNumber];
    
    UIButton *eightNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
    eightNumber.backgroundColor = [UIColor grayColor];
    eightNumber.tag = 8;
    [eightNumber setTitle:@"8"
                 forState:UIControlStateNormal];
    [eightNumber addTarget:self
                    action:@selector(addDigit:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eightNumber];
    
    UIButton *nineNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
    nineNumber.backgroundColor = [UIColor grayColor];
    nineNumber.tag = 9;
    [nineNumber setTitle:@"9"
                forState:UIControlStateNormal];
    [nineNumber addTarget:self
                   action:@selector(addDigit:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nineNumber];
    
    UIButton *plusButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, buttonHeight, buttonWidth, buttonHeight)];
    plusButton.backgroundColor = [UIColor orangeColor];
    [plusButton setTitle:@"+"
                forState:UIControlStateNormal];
    [plusButton addTarget:self
                   action:@selector(setOperand:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plusButton];
    
    //next row of buttons
    UIButton *fourNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 2 * buttonHeight, buttonWidth, buttonHeight)];
    fourNumber.backgroundColor = [UIColor grayColor];
    fourNumber.tag = 4;
    [fourNumber setTitle:@"4"
                forState:UIControlStateNormal];
    [fourNumber addTarget:self
                   action:@selector(addDigit:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fourNumber];
    
    UIButton *fiveNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
    fiveNumber.backgroundColor = [UIColor grayColor];
    fiveNumber.tag = 5;
    [fiveNumber setTitle:@"5"
                forState:UIControlStateNormal];
    [fiveNumber addTarget:self
                   action:@selector(addDigit:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fiveNumber];
    
    UIButton *sixNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
    sixNumber.backgroundColor = [UIColor grayColor];
    sixNumber.tag = 6;
    [sixNumber setTitle:@"6"
               forState:UIControlStateNormal];
    [sixNumber addTarget:self
                  action:@selector(addDigit:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sixNumber];
    
    UIButton *minusButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 2 * buttonHeight, buttonWidth, buttonHeight)];
    minusButton.backgroundColor = [UIColor orangeColor];
    [minusButton setTitle:@"-"
                 forState:UIControlStateNormal];
    [minusButton addTarget:self
                    action:@selector(setOperand:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:minusButton];
    
    //next row of buttons
    UIButton *oneNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 3 * buttonHeight, buttonWidth, buttonHeight)];
    oneNumber.backgroundColor = [UIColor grayColor];
    oneNumber.tag = 1;
    [oneNumber setTitle:@"1"
               forState:UIControlStateNormal];
    [oneNumber addTarget:self
                  action:@selector(addDigit:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneNumber];
    
    UIButton *twoNumber = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
    twoNumber.backgroundColor = [UIColor grayColor];
    twoNumber.tag = 2;
    [twoNumber setTitle:@"2"
               forState:UIControlStateNormal];
    [twoNumber addTarget:self
                  action:@selector(addDigit:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoNumber];
    
    UIButton *threeNumber = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
    threeNumber.backgroundColor = [UIColor grayColor];
    threeNumber.tag = 3;
    [threeNumber setTitle:@"3"
                 forState:UIControlStateNormal];
    [threeNumber addTarget:self
                    action:@selector(addDigit:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:threeNumber];
    
    UIButton *multiplyButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 3 * buttonHeight, buttonWidth, buttonHeight)];
    multiplyButton.backgroundColor = [UIColor orangeColor];
    [multiplyButton setTitle:@"x"
                    forState:UIControlStateNormal];
    [multiplyButton addTarget:self
                       action:@selector(setOperand:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:multiplyButton];
    
    //last row of buttons
    UIButton *zeroNumber = [[UIButton alloc] initWithFrame:CGRectMake(0, 4 * buttonHeight, 2 * buttonWidth, buttonHeight)];
    zeroNumber.backgroundColor = [UIColor grayColor];
    [zeroNumber setTitle:@"0"
                forState:UIControlStateNormal];
    [zeroNumber addTarget:self
                   action:@selector(addDigit:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zeroNumber];
    
    UIButton *equalsButton = [[UIButton alloc] initWithFrame:CGRectMake(2 * buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
    equalsButton.backgroundColor = [UIColor orangeColor];
    [equalsButton setTitle:@"="
                  forState:UIControlStateNormal];
    [equalsButton addTarget:self.calculator
                     action:@selector(calculate)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:equalsButton];
    
    UIButton *divisionButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * buttonWidth, 4 * buttonHeight, buttonWidth, buttonHeight)];
    divisionButton.backgroundColor = [UIColor orangeColor];
    [divisionButton setTitle:@"÷"
                    forState:UIControlStateNormal];
    [divisionButton addTarget:self
                       action:@selector(setOperand:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:divisionButton];
}

- (void)loadView
{
    
}

- (void)addDigit:(id)sender
{
    UIButton *button = (UIButton *) sender;
    NSLog(@"Tag of button: %i", button.tag);
    [self.calculator addDigit:button.tag];
}

- (void)setOperand:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    if([buttonPressed.titleLabel.text isEqualToString:@"+"]){
        NSLog(@"Operation set to add");
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationAdd];
    }
    else if([buttonPressed.titleLabel.text isEqualToString:@"-"]){
                NSLog(@"Operation set to subtract");
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationSubtract];
    }
    else if([buttonPressed.titleLabel.text isEqualToString:@"x"]){
                NSLog(@"Operation set to multiply");
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationMultiply];
    }
    if([buttonPressed.titleLabel.text isEqualToString:@"÷"]){
                NSLog(@"Operation set to divide");
        [self.calculator setOperation:(DEVCalculatorOperation) DEVCalculatorOperationDivide];
    }
}

- (void)digitAdded
{
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f", self.calculator.activeNumber];
}

- (void)didCalculateWithResult
{
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f", self.calculator.inactiveNumber];
}

- (void)operandDidChange
{
    self.numberDisplay.text = [NSString stringWithFormat:@"%.2f",self.calculator.activeNumber];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
