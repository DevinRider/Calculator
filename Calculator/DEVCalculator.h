//
//  DEVCalculator.h
//  Calculator
//
//  Created by Devin on 6/4/14.
//  Copyright (c) 2014 Devin Rider. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DEVCalculator;

@protocol DEVCalculatorDelegate <NSObject>

@optional
- (void)calculator:(DEVCalculator *)calculator didCalculateWithResult:(float)result;

@end

typedef enum DEVCalculatorOperation{
    DEVCalculatorOperationMultiply,
    DEVCalculatorOperationDivide,
    DEVCalculatorOperationAdd,
    DEVCalculatorOperationSubtract
} DEVCalculatorOperation;


@interface DEVCalculator : NSObject

@property (nonatomic) float result;
@property (nonatomic, strong) id <DEVCalculatorDelegate> delegate;

- (void)calculateWithOperation:(DEVCalculatorOperation)operation number:(float)number;

@end
