//
//  RealmManager.h
//  News
//
//  Created by Cristian Fernandez on 11/26/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealmManager : NSObject
+(RLMResults*)getAllDogs;
+(void)createDog:(NSString*)dogName dogColor:(NSString*)dogColor imageName:(NSString*)imageName;
+(RLMResults*)deleteDog:(RLMResults*)dogsArray row:(NSInteger*)row;
@end
