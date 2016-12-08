//
//  Dog.h
//  
//
//  Created by Cristian Fernandez on 12/6/16.
//
//
#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Dog : RLMObject
    @property NSString *name;
    @property NSString *color;
    @property NSString *imageName;
@end
RLM_ARRAY_TYPE(Dog)