//
//  FoodCollectionViewCell.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCollectionViewCell : UICollectionViewCell

@property (nonatomic,weak) IBOutlet UIImageView *foodImageView;
@property (nonatomic,weak) IBOutlet UILabel *foodNameLabel;

@end
