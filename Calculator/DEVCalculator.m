//
//  DEVCalculator.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import "DEVCalculator.h"


@implementation DEVCalculator

- (instancetype)init
{
    self = [super init];
    self.inactiveNumber = 0;
    self.activeNumber = 0;
    return self;
}

- (void)addDigit:(int)digit
{
    //code to append whatever digit to the end of the active number
}

- (void)setOperation:(DEVCalculatorOperation)operation
{
    NSLog(@"Operand changed");
    self.currentOperand = operation;
    self.inactiveNumber = self.activeNumber;
    self.activeNumber = 0;
    if(self.delegate){
        NSLog(@"Delegate exists");
        if([self.delegate respondsToSelector:@selector(operandDidChange:)]){
                        NSLog(@"DELEGATE RESPONDED");
            [self.delegate operandDidChange];
        }
    }
}

- (void)calculate
{
    NSLog(@"Calculate attempted");
    switch (self.currentOperand) {
        case DEVCalculatorOperationAdd:
            self.inactiveNumber += self.activeNumber;
            break;
        case DEVCalculatorOperationDivide:
            self.inactiveNumber /= self.activeNumber;
            break;
        case DEVCalculatorOperationMultiply:
            self.inactiveNumber *= self.activeNumber;
            break;
        case DEVCalculatorOperationSubtract:
            self.inactiveNumber -= self.activeNumber;
            break;
    }
    if (self.delegate) {
        NSLog(@"Delegate exists");
        if([self.delegate respondsToSelector:@selector(didCalculateWithResult:)]){
            NSLog(@"DELEGATE RESPONDED");
            [self.delegate didCalculateWithResult:self.inactiveNumber];
        }
    }
}


@end
