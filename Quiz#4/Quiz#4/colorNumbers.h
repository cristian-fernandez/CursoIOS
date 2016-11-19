//
//  colorNumbers.h
//  Quiz#4
//
//  Created by Cristian Fernandez on 11/19/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface colorNumbers : NSObject
@property(readonly) NSString *numberText;
@property(readonly) NSString *background;

-(id)initWithName:(NSString*)numberText background:(NSString*)background;
@end
