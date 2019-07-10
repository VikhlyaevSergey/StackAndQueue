//
//  QueueObject.h
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ObjectGettingProtocol.h"
#import "ObjectsRemovingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface QueueObject : NSObject <ObjectGettingProtocol>

@property (assign, nonatomic) NSInteger count;

- (void)addElement: (NSInteger)element withCompletion:(nullable void (^)(void))completion;
- (void)removeAll: (nullable void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
