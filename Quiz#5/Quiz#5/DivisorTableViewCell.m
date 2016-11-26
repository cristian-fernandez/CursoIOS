//
//  DivisorTableViewCell.m
//  Quiz#5
//
//  Created by Cristian Fernandez on 11/26/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "DivisorTableViewCell.h"


@interface DivisorTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *DivisorLabel;

@end
@implementation DivisorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupCellWithDivi:(NSString*)divi{
    self.DivisorLabel.text = divi;
}

@end
