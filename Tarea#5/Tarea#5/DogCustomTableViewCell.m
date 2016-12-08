//
//  DogCustomTableViewCell.m
//  Tarea#5
//
//  Created by Cristian Fernandez on 12/6/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "DogCustomTableViewCell.h"
#import "Dog.h"

@interface DogCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *dogImagen;
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogColorLabel;

@end
@implementation DogCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellWithDogs:(Dog *)dog{
    
    UIImage *img = [UIImage imageNamed:dog.imageName];
    self.dogImagen.image = img;
    self.dogNameLabel.text = dog.name;
    self.dogColorLabel.text = dog.color;
    
}
@end
