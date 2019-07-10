//
//  ValueCollectionViewCell.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "ValueCollectionViewCell.h"


@interface ValueCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation ValueCollectionViewCell

- (void)setValue: (NSInteger)value {
    _valueLabel.text = [NSString stringWithFormat: @"%ld", (long)value];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [_valueLabel setText: @""];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = UIColor.whiteColor;
    self.layer.cornerRadius = 8;
}

@end
