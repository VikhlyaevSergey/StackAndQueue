//
//  ValueCollectionViewCell.h
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SomeRetainDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ValueCollectionViewCell : UICollectionViewCell

- (void)setValue: (NSInteger)value;

// @property (strong, nonatomic) id<SomeRetainDelegate> delegate; // (4) retain cycle, механизм исправления ниже
@property (weak, nonatomic) id<SomeRetainDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
