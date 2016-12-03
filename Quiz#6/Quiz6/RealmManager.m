//
//  RealmManager.m
//  News
//
//  Created by Cristian Fernandez on 11/26/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "RealmManager.h"
#import <Realm/Realm.h>
#import "Person.h"

#define PERSON_NAME_KEY @"PERSON_NAME_KEY"
#define PERSON_ORDER_NAME_KEY @"PERSON_ORDER_NAME_KEY"

@implementation RealmManager

+(RLMResults*)getAllPersons{
    if([self needsToInsertPersons]){
        [self createDefaultPersons];
    }
    return [Person allObjects];
}

+(BOOL)needsToInsertPersons{
    RLMResults<Person *> *persons = [Person allObjects];// retrieves all Categories from the default Realm
    if(persons.count==0){
        return true;
    }
    return false;
}
+(void) insertObjectInDB:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}
//-(Person*)getCategoryWithName:(NSString*)categoryName{
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.categoryTitle =%@",categoryName];
//    RLMResults<Category *> *categories = [Category objectsWithPredicate:predicate];
//    if(categories.count>0){
//        return categories.firstObject;
//    }
//    return nil;
//}
//+(RLMArray*)getNewsWithCategoryName:(NSString*)categoryName{
//    Category *category = [self getCategoryWithName:categoryName];
//    return category.news;
//}
+(NSArray*)createPersonsDictionary{
    return [[NSArray alloc] initWithObjects:
            @{PERSON_NAME_KEY:@"Enrique",PERSON_ORDER_NAME_KEY:@"4"},
            @{PERSON_NAME_KEY:@"Cristian",PERSON_ORDER_NAME_KEY:@"5"},
            @{PERSON_NAME_KEY:@"Javier",PERSON_ORDER_NAME_KEY:@"1"},
            @{PERSON_NAME_KEY:@"Carlos",PERSON_ORDER_NAME_KEY:@"2"},
            @{PERSON_NAME_KEY:@"Alejandro",PERSON_ORDER_NAME_KEY:@"10"},
            @{PERSON_NAME_KEY:@"Abismei",PERSON_ORDER_NAME_KEY:@"9"},
            @{PERSON_NAME_KEY:@"Ignacio",PERSON_ORDER_NAME_KEY:@"8"},
            @{PERSON_NAME_KEY:@"Luis",PERSON_ORDER_NAME_KEY:@"7"},
            @{PERSON_NAME_KEY:@"Alonso",PERSON_ORDER_NAME_KEY:@"6"},
            @{PERSON_NAME_KEY:@"Sergio",PERSON_ORDER_NAME_KEY:@"3"},
             nil];
}

+(void)createDefaultPersons{
    NSArray *personArray = [self createPersonsDictionary];
    for (NSDictionary *personDictionary in personArray) {
        Person *person = [Person new];
        person.name = [personDictionary valueForKey:PERSON_NAME_KEY];
        person.order = [personDictionary valueForKey:PERSON_ORDER_NAME_KEY];
        [self insertObjectInDB:person];
    }
}

@end
