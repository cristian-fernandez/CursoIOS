//
//  Fibonacci.m
//  Tarea4
//
//  Created by Cristian Fernandez on 11/18/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "Fibonacci.h"

@interface Fibonacci()
@property(nonatomic,strong) NSString *fiboText;
@end

@implementation Fibonacci

-(id)initWithName:(NSString*)fibo {
    if(self = [self init]){
        _fiboText = fibo;
    }
    return self;
}

@end
