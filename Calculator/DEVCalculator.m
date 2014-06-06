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

- (void)addDigit:(UIButton *)button
{
    //code to append whatever digit to the end of the active number
}

- (void)setOperation:(DEVCalculatorOperation)operation
{
    self.currentOperand = operation;
    if([self.delegate respondsToSelector:@selector(calculator:operandDidChange:)]){
        [self.delegate calculator:self operandDidChange:(DEVCalculatorOperation)operation];
    }
}

- (void)calculate
{
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
        if([self.delegate respondsToSelector:@selector(calculator:didCalculateWithResult:)]){
            [self.delegate calculator:self didCalculateWithResult:self.inactiveNumber];
        }
    }
}


@end
