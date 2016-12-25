//
//  DetailViewController.m
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/15/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "DetailViewController.h"
#import "Detail.h"
#import "RealmManager.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detailSegmentControl;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property  Detail *detailObject;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadDetail];
    [self imageAnimation];

}

-(void)loadDetail{
    self.detailObject = [RealmManager getDetailsWithFoodName:self.FoodName];
    self.detailTextView.text = self.detailObject.History;
}

-(void) imageAnimation{
    UIImage *image1 = [UIImage imageNamed:self.detailObject.Image];
    NSArray *images = [[NSArray alloc] initWithObjects:image1,nil];
    self.imageView.animationImages = images;
    self.imageView.animationDuration = 10;
    self.imageView.animationRepeatCount = 0;
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)detailSegmentControl:(id)sender {
    if (self.detailSegmentControl.selectedSegmentIndex == 0) {//historia
        self.detailTextView.text = self.detailObject.History;
    } else if(self.detailSegmentControl.selectedSegmentIndex == 1) {//receta
        self.detailTextView.text = self.detailObject.Recipe;
    } else if(self.detailSegmentControl.selectedSegmentIndex == 2) {//ingrediente
        self.detailTextView.text = self.detailObject.Ingredient;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
