//
//  FibonacciCustomTableViewCell.h
//  Tarea4
//
//  Created by Cristian Fernandez on 11/18/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Fibonacci;

@interface FibonacciCustomTableViewCell : UITableViewCell
-(void)setupCellWithFibo:(Fibonacci*)fibo;
@end
