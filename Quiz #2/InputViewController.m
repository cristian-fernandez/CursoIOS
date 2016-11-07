//
//  InputViewController.m
//  Quiz2CristianFernandez
//
//  Created by Cristian Fernandez on 11/5/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "InputViewController.h"
#import "CounterViewController.h"

@interface InputViewController ()

@property (weak, nonatomic) IBOutlet UITextField *texto;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ProcesarTexto:(id)sender {
    
    
   CounterViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"CounterViewController"];
    NSUInteger theinteger = [self.texto.text rangeOfString:self.texto.text].length ;
    NSString *string = [NSString stringWithFormat:@"%d", theinteger];
     nextViewController.resultado = string;
   
    [self.navigationController pushViewController:nextViewController animated: YES];

    
}
NSInteger strlength(NSString *str){
    NSRange r = [str rangeOfString:str];
    return r.length;
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
