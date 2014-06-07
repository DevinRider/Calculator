//
//  DEVCalculator.m
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import "DEVCalculator.h"

@interface DEVCalculator ()

@property int numberOfDecimalPlaces;
@property NSNumberFormatter *formatter;

@end

@implementation DEVCalculator

- (instancetype)init
{
    self = [super init];
    self.activeNumber = 0;
    self.inactiveNumber = 0;
    self.numberOfDecimalPlaces = 0;
    self.formatter = [[NSNumberFormatter alloc] init];
    return self;
}

- (void)addDigit:(int)digit
{
    //currently this will only work for whole numbers
    self.activeNumber = (self.activeNumber * 10) + digit;
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(digitDisplayChange:)]){
            [self.delegate digitDisplayChange:self.numberOfDecimalPlaces];
        }
    }
}

- (void)changeSign
{
    self.activeNumber *= -1;
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(digitDisplayChange:)]){
            [self.delegate digitDisplayChange:self.numberOfDecimalPlaces];
        }
    }
}

- (void)clear
{
    self.inactiveNumber = 0;
    self.activeNumber = 0;
    self.numberOfDecimalPlaces = 0;
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(digitDisplayChange:)]){
            [self.delegate digitDisplayChange:self.numberOfDecimalPlaces];
        }
    }
}

- (void)makePercentage
{
    self.activeNumber /= 100;
    self.numberOfDecimalPlaces += 2;
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(digitDisplayChange:)]){
            [self.delegate digitDisplayChange:self.numberOfDecimalPlaces];
        }
    }
}


- (void)setOperation:(DEVCalculatorOperation)operation
{
    self.currentOperand = operation;
    self.inactiveNumber = self.activeNumber;
    self.activeNumber = 0;
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(digitDisplayChange:)]){
            [self.delegate digitDisplayChange:self.numberOfDecimalPlaces];
        }
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
        if([self.delegate respondsToSelector:@selector(didCalculateWithResult)]){
            [self.delegate didCalculateWithResult];
        }
    }
}


@end
