//
//  TypeCustomTableViewCell.m
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "TypeCustomTableViewCell.h"
#import "Type.h"

@interface TypeCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *TypeImage;

@property (weak, nonatomic) IBOutlet UILabel *TypeNameLabel;
@end

@implementation TypeCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellWithTypes:(Type*)type{
    //self.image.text = dog.name;
    UIImage *img = [UIImage imageNamed:type.imageName];
    self.TypeImage.image = img;
    self.TypeNameLabel.text = type.typeName;
    
}

@end
