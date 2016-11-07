//
//  ResultadoViewController.m
//  Tarea1
//
//  Created by Cristian Fernandez on 11/7/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "ResultadoViewController.h"

@interface ResultadoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultadoLabel;

@end

@implementation ResultadoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.resultadoLabel.text = self.valorResultado;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
