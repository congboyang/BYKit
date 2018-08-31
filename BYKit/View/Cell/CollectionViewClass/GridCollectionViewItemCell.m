//
//  GridCollectionViewItemCell.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/27.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "GridCollectionViewItemCell.h"
#import "UIView+AnimationProperty.h"
#import "UIColor+CustomColor.h"
#import "UIView+SetRect.h"

@implementation GridItemModel

+ (instancetype)gridItemModelWithTitle:(NSString *)title icon:(NSString *)icon {
    
    GridItemModel *model = [[self class] new];
    model.title          = title;
    model.icon           = icon;
    
    return model;
}

@end

@interface GridCollectionViewItemCell ()

@property (nonatomic, strong) UIView      *rightLine;
@property (nonatomic, strong) UIView      *downLine;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation GridCollectionViewItemCell

- (void)setupCell {
    
    self.contentView .backgroundColor = [UIColor whiteColor];
    
    // KohinoorDevanagari-Light
}

- (void)buildSubview {
    
    self.rightLine                 = [UIView new];
    self.rightLine.backgroundColor = [UIColor colorFromHexRGB:@"E8E8E8"];
    [self.contentView addSubview:self.rightLine];
    
    self.rightLine.top = 0;
    self.rightLine.right = self.right;
    self.rightLine.height = self.height;
    self.rightLine.width = 0.5;
    
    self.downLine                 = [UIView new];
    self.downLine.backgroundColor = [UIColor colorFromHexRGB:@"F7F7F7"];
    [self.contentView addSubview:self.downLine];
    
    self.downLine.bottom = self.bottom;
    self.downLine.left = 0;
    self.downLine.height = 0.5;
    self.downLine.width = self.contentView.width;
    
    self.imageView                 = [UIImageView new];
    [self.contentView addSubview:self.imageView];
    
    self.imageView.width = self.contentView.width * 0.4;
    self.imageView.height = self.contentView.height * 0.4;
    self.imageView.center = self.contentView.center;
    
    self.titleLabel               = [UILabel new];
    self.titleLabel.font          = [UIFont fontWithName:@"KohinoorDevanagari-Light" size:10.f];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.bottom = self.contentView.bottom - 10;
    self.titleLabel.centerX = self.contentView.centerX;
}

- (void)loadContent {
    
    GridItemModel *model = self.data;
    self.imageView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.title;
}

- (void)setHighlighted:(BOOL)highlighted {
    
    [super setHighlighted:highlighted];
    
    [UIView animateWithDuration:0.25f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        self.imageView.scale             = highlighted ? 0.95 : 1.f;
        self.titleLabel.alpha            = highlighted ? 0.85 : 1.f;
        self.contentView.backgroundColor = highlighted ? [UIColor colorFromHexRGB:@"e8e8e8"] : [UIColor whiteColor];
        
    } completion:nil];
}
@end
