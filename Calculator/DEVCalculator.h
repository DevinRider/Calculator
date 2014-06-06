//
//  DEVCalculator.h
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DEVCalculator;

typedef enum DEVCalculatorOperation{
    DEVCalculatorOperationMultiply,
    DEVCalculatorOperationDivide,
    DEVCalculatorOperationAdd,
    DEVCalculatorOperationSubtract
} DEVCalculatorOperation;


@protocol DEVCalculatorDelegate <NSObject>

@optional
- (void)calculator:(DEVCalculator *)calculator didCalculateWithResult:(float)result;
- (void)calculator:(DEVCalculator *)calculator operandDidChange:(DEVCalculatorOperation *)operation;

@end



@interface DEVCalculator : NSObject

//"activeNumber" represents the number that digits should be added to should a number button be pressed
@property float activeNumber;
//"inactiveNumber" represents the saved number, after the operand button is pushed or = is pushed (inactive is the result)
@property float inactiveNumber;

@property DEVCalculatorOperation currentOperand;

@property (nonatomic, strong) id <DEVCalculatorDelegate> delegate;

- (void)addDigit:(UIButton *)button;

- (void)setOperation:(DEVCalculatorOperation)operation;

- (void)calculate;

@end
