//
//  DEVCalculatorViewController.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import "DEVCalculatorViewController.h"
#import "DEVCalculator.h"
#import "DEVCalculatorView.h"

@interface DEVCalculatorViewController ()

//not sure if this needs to be a property in order to be used by other classes...just figured it should go here?
@property (nonatomic) DEVCalculator *calculator;

@end

@implementation DEVCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.calculator = [[DEVCalculator alloc] init];
        self.calculator.result = 10;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)loadView
{
    //this is ideally how I would like to set everything up. It's clean and easy to read but I am unsure where the connection between
    //the DEVCalculator and the DEVCalculatorView is to be made
    [self.calculator calculateWithOperation:DEVCalculatorOperationAdd
                                     number:10];
    NSLog(@"%f", self.calculator.result);
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    DEVCalculatorView *calcView = [[DEVCalculatorView alloc] initWithFrame:frame];
    
    self.view = calcView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
