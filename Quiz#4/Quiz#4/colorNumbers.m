//
//  colorNumbers.m
//  Quiz#4
//
//  Created by Cristian Fernandez on 11/19/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "colorNumbers.h"

@interface colorNumbers()
@property(nonatomic,strong) NSString *numberText;
@property(nonatomic,strong) NSString *background;
@end

@implementation colorNumbers
-(id)initWithName:(NSString*)numberText background:(NSString*)background{
    if(self = [self init]){
        _numberText = numberText;
        _background = background;
    }
    return self;
}
@end





