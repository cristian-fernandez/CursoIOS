//
//  ViewController.m
//  Tarea1
//
//  Created by Cristian Fernandez on 11/7/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "ViewController.h"
#import "ResultadoViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldDato1;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDato2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)procesoSumar:(id)sender {
    [self procesar:@"suma"];
}
- (IBAction)procesoMultiplicar:(id)sender {
    [self procesar:@"multiplicacion"];
}
- (IBAction)procesoDividir:(id)sender {
    [self procesar:@"division"];
}
- (IBAction)procesoRestar:(id)sender {
    [self procesar:@"resta"];
}
- (void) procesar: (NSString*) tipo{
    if([self validaOperacion:tipo] == true){
        ResultadoViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"ResultadoViewController"];
        double valorA = [self.textFieldDato1.text doubleValue];
        double valorB = [self.textFieldDato2.text doubleValue];
        double resultado;
        
        if([tipo  isEqual: @"suma"]){
            resultado = valorA + valorB;
        }else if([tipo  isEqual: @"multiplicacion"]){
            resultado = valorA * valorB;
        }else if([tipo  isEqual: @"division"]){
            resultado = valorA / valorB;
        }else if([tipo  isEqual: @"resta"]){
            resultado = valorA - valorB;
        }
        
        
        NSString *total = [NSString stringWithFormat:@"%.2f", resultado];
        
        
        nextViewController.valorResultado = [NSString stringWithFormat:@"El resultado de la %@ es: %@",tipo,total];
        
        [self.navigationController pushViewController:nextViewController animated: YES];
    }
}
-(bool) validaOperacion:(NSString*) tipo
{
    
    if(self.textFieldDato1.text == nil || self.textFieldDato1.text.length == 0){
        [self showAlertMessage:@"Favor ingresar el primer número."];
        return false;
    }
    
    if(self.textFieldDato2.text == nil || self.textFieldDato2.text.length == 0){
        [self showAlertMessage:@"Favor ingresar el segundo número."];
        return false;
    }
    
    if(![self isValidFloatString:self.textFieldDato1.text]){
        [self showAlertMessage:@"El primer número es invalido."];
        return false;
    }
    
    if(![self isValidFloatString:self.textFieldDato2.text]){
        [self showAlertMessage:@"El segundo número es invalido."];
        return false;
    }
    
//    double valorA = [self.textFieldDato1.text doubleValue];
    double valorB = [self.textFieldDato2.text doubleValue];
    
    if([tipo isEqual:@"division"] && valorB==0){
        [self showAlertMessage:@"Division entre cero (0) detectada."];
        return false;
    }
    return true;
}

- (BOOL)isValidFloatString:(NSString *)str
{
    const char *s = str.UTF8String;
    char *end;
    strtod(s, &end);
    return !end[0];
}


-(void) showAlertMessage: (NSString*) message{
    NSString *title = @"Error en el proceso";
    NSString *OKText = @"OK";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:OKText style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
