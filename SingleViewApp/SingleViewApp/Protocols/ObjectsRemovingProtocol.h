//
//  ObjectsRemovingProtocol.h
//  SingleViewApp
//
//  Created by Сергей Вихляев on 10/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ObjectsRemovingProtocol <NSObject>

- (void)removeAll: (nullable void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
