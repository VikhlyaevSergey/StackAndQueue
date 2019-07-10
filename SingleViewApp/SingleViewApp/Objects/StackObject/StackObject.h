//
//  StackObject.h
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ObjectGettingProtocol.h"
#import "ObjectsRemovingProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface StackObject : NSObject <ObjectGettingProtocol, ObjectsRemovingProtocol> // (3) Множественное наследование

@property (assign, nonatomic) NSInteger count;

- (void) addElement: (NSInteger)element withCompletion:(nullable void (^)(void))completion withFailure:(nullable void (^)(void))failure;
- (void) removeElement: (nullable void (^)(void))completion withFailure:(nullable void (^)(void))failure;

@end

NS_ASSUME_NONNULL_END
