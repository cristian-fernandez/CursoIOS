//
//  RealmManager.m
//  News
//
//  Created by Cristian Fernandez on 11/26/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "RealmManager.h"
#import <Realm/Realm.h>
#import "Dog.h"

@implementation RealmManager

+(RLMResults*)getAllDogs{
    RLMResults<Dog *> *dogs = [Dog allObjects];// Por alguna rara razon no me sirvia el [Dog allObjects] hasta que coloque esta linea.
    return [Dog allObjects];
}

+(void) insertObjectInDB:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(void)createDog:(NSString*)dogName dogColor:(NSString*)dogColor imageName:(NSString*)imageName{
    
    Dog *dog = [Dog new];
    dog.imageName = imageName;
    dog.name = dogName;
    dog.color = dogColor;
    [self insertObjectInDB:dog];
}

+(RLMResults*)deleteDog:(RLMResults*)dogsArray row:(NSInteger*)row{
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm]deleteObject:[dogsArray objectAtIndex:row]];
    [[RLMRealm defaultRealm] commitWriteTransaction];
    
    return [Dog allObjects];
}

@end
