//
//  ObjectGettingProtocol.h
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ObjectGettingProtocol <NSObject>

- (NSInteger)objectAtIndex: (NSInteger) index;

@end

NS_ASSUME_NONNULL_END
