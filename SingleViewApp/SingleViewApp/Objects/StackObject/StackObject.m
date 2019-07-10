//
//  StackObject.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "StackObject.h"

#import "NSMutableArray+Reversing.h"

@interface StackObject()

@property (strong, nonatomic)  NSMutableArray* array;

@end


@implementation StackObject

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Support func-s
@synthesize count = _count;

- (NSInteger) count {
    return _array.count;
}

- (void) addElement: (NSInteger)element withCompletion:(nullable void (^)(void))completion withFailure:(nullable void (^)(void))failure {
    if (_count < 5) {
        NSMutableArray* reversedArray = [_array reversed];
        [reversedArray addObject: [NSNumber numberWithInteger:element]];
        _array = [reversedArray reversed];
        _count = _array.count;
        if (completion) {
            completion();
        }
    } else {
        if (failure) {
            failure();
        }
    }
}

- (void) removeElement: (nullable void (^)(void))completion withFailure:(nullable void (^)(void))failure {
    if (_count > 0) {
        [_array removeObjectAtIndex:0];
        _count = _array.count;
        if (completion) {
            completion();
        }
    } else {
        if (failure) {
            failure();
        }
    }
}

#pragma mark - ObjectGettingProtocol
- (NSInteger)objectAtIndex:(NSInteger)index {
    return [_array[index] intValue];
}

#pragma mark - ObjectRemoovingProtocol
- (void)removeAll:(nullable void (^)(void))completion {
    [_array removeAllObjects];
    if (completion) {
        completion();
    }
}

@end
