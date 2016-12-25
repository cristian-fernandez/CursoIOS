//
//  FoodViewController.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) IBOutlet UICollectionView *FoodCollectionView;
@property  (nonatomic,strong) NSString *TypeName;
@end
