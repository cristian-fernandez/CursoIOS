//
//  Person.h
//  Quiz6
//
//  Created by Cristian Fernandez on 12/3/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Person : RLMObject
@property NSString *order;
@property NSString *name;
@end
RLM_ARRAY_TYPE(Person)