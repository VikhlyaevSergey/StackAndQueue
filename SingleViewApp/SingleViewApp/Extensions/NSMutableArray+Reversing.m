//
//  NSMutableArray+Reversing.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 10/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "NSMutableArray+Reversing.h"

@implementation NSMutableArray (Reversing)

-(NSMutableArray*)reversed {
    return  [[[self reverseObjectEnumerator] allObjects] mutableCopy];
}
@end
