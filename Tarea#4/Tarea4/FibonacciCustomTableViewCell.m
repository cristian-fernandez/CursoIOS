//
//  FibonacciCustomTableViewCell.m
//  Tarea4
//
//  Created by Cristian Fernandez on 11/18/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "FibonacciCustomTableViewCell.h"
#import "Fibonacci.h"

@interface FibonacciCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *fiboLabel;

@end

@implementation FibonacciCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupCellWithFibo:(Fibonacci*)fibo{
    self.fiboLabel.text = fibo.fiboText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
