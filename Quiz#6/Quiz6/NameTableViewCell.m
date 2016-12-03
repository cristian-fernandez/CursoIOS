//
//  NameTableViewCell.m
//  
//
//  Created by Cristian Fernandez on 12/3/16.
//
//

#import "NameTableViewCell.h"
#import "Person.h"

@interface NameTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@end

@implementation NameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupCellWithPerson:(Person*)person{
    //self.image.text = dog.name;
       self.NameLabel.text = person.name;
    
}

@end
