//
//  CustomTableViewCell.m
//  Quiz#4
//
//  Created by Cristian Fernandez on 11/19/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "colorNumbers.h"

@interface CustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *colorNumberLabel;

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setupCellWithColors:(colorNumbers*)color{
    self.colorNumberLabel.text = color.numberText;
    self.colorNumberLabel.backgroundColor = ([color.background isEqual:@"Azul"])?[UIColor blueColor]:[UIColor redColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
