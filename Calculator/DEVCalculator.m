//
//  DEVCalculator.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import "DEVCalculator.h"

@implementation DEVCalculator

- (void)addDigit:(UIButton *)button
{
    //code to append whatever digit to the end of the 
}

- (void)calculateWithOperation:(DEVCalculatorOperation)operation number:(float)number
{
    switch (operation) {
        case DEVCalculatorOperationAdd:
            self.result += number;
            break;
        case DEVCalculatorOperationDivide:
            self.result /= number;
            break;
        case DEVCalculatorOperationMultiply:
            self.result *= number;
            break;
        case DEVCalculatorOperationSubtract:
            self.result -= number;
            break;
    }
    if (self.delegate) {
        if([self.delegate respondsToSelector:@selector(calculator:didCalculateWithResult:)]){
            [self.delegate calculator:self didCalculateWithResult:self.result];
        }
    }
}


@end
