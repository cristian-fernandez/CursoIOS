//
//  FoodViewController.m
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodCollectionViewCell.h"
#import "RealmManager.h"
#import <Realm/Realm.h>
#import "Food.h"
#import "DetailViewController.h"


const CGFloat leftAndRightPaddings = 32.0;
const CGFloat numberOfItemsPerRow = 3.0;
const CGFloat heigthAdjustment = 30.0;
#define CUSTOM_CELL_IDENTIFIER @"FoodCollectionViewCell"

@interface FoodViewController ()

@property  RLMArray *FoodArray;

@end



@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.FoodArray = @[@"Bocas",@"Almuerzo",@"Bebidas",@"Desayuno"];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadNews];
}
-(void)loadNews{
    self.FoodArray = [RealmManager getFoodsWithTypeName:self.TypeName];
    [self.FoodCollectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.FoodArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CUSTOM_CELL_IDENTIFIER forIndexPath:indexPath];
    
    Food *foodToShow = self.FoodArray[indexPath.row];
    
    
    
    cell.foodImageView.image = [UIImage imageNamed:foodToShow.Image];
    cell.foodNameLabel.text = foodToShow.FoodName;
    
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (CGRectGetWidth(self.view.bounds) - leftAndRightPaddings) / numberOfItemsPerRow;
    return CGSizeMake(width, width + heigthAdjustment);
    //return CGSizeMake(150.0, 150.0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    DetailViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    //Type *typeSelected = self.typesArray[indexPath.row];
    //nextViewController.TypeName = typeSelected.typeName;
    [self.navigationController pushViewController:nextViewController animated: YES];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    DetailViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    Food *foodSelected = self.FoodArray[indexPath.row];
    nextViewController.FoodName = foodSelected.FoodName;
    [self.navigationController pushViewController:nextViewController animated: YES];
}

@end
