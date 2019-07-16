//
//  QueueObject.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "QueueObject.h"

#import "NSMutableArray+Reversing.h"

@interface QueueObject()

@property (strong, nonatomic)  NSMutableArray* array;

@property (assign, nonatomic)  NSInteger maxSize; // Max size of collection

@end

@implementation QueueObject

- (instancetype)init {
    self = [super init];
    if (self) {
        _maxSize = 5;
        _array = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Support func-s
- (NSInteger) count {
    return _array.count;
}

- (void)addElement: (NSInteger)element withCompletion:(nullable void (^)(void))completion {
    if (_count < _maxSize) {
        [_array addObject: [NSNumber numberWithInteger:element]];
        _count = _array.count;
        if (completion) {
            completion();
        }
    } else {
        [_array removeObjectAtIndex:0];
        [_array addObject: [NSNumber numberWithInteger:element]];
        if (completion) {
            completion();
        }
    }
}

#pragma mark - ObjectGettingProtocol
- (NSInteger)objectAtIndex:(NSInteger)index {
    return [[_array reversed][index] intValue];
}

#pragma mark - ObjectsRemovingProtocol
- (void)removeAll: (nullable void (^)(void))completion {
    [_array removeAllObjects];
    _count = _array.count;
    if (completion) {
        completion();
    }
}

@end
