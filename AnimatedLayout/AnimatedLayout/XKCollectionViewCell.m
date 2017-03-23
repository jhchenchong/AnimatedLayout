//
//  XKCollectionViewCell.m
//  AnimatedCollectionViewLayout
//
//  Created by 浪漫恋星空 on 2017/3/22.
//  Copyright © 2017年 浪漫恋星空. All rights reserved.
//

#import "XKCollectionViewCell.h"
#import "Masonry/Masonry.h"

@interface XKCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation XKCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self initUserInterface];
    }
    return self;
}

- (void)initUserInterface {
    
    self.imageView = [[UIImageView alloc] init];
    self.label = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.imageView];
    [self.imageView addSubview:self.label];
    
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont boldSystemFontOfSize:30];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(300);
        make.height.offset(60);
        make.center.equalTo(self.imageView);
    }];
    
    [super updateConstraints];
}

- (void)setModel:(CellModel *)model {
    
    _model = model;
    
    self.label.text = model.string;
    
    self.imageView.backgroundColor = model.color;
}

@end
