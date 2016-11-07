//
//  CounterViewController.m
//  Quiz2CristianFernandez
//
//  Created by Cristian Fernandez on 11/5/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultadoLabel;

@end

@implementation CounterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.[NSString stringWithFormat:@"HOLA %@",[self.personName uppercaseString]];

    
    self.resultadoLabel.text= self.resultado;
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
