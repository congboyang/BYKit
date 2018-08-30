//
//  AnimationPopCell.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/25.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "AnimationPopCell.h"
#import "POP.h"
#import "AnimationCellModel.h"
#import "UIFont+Fonts.h"

@interface AnimationPopCell()

@property (nonatomic, strong) UILabel  *titlelabel;
@property (nonatomic, strong) UILabel  *subTitleLabel;

@end

@implementation AnimationPopCell

- (void)setupCell {
    
    self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)buildSubview {
    
    self.titlelabel      = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 290, 25)];
    [self addSubview:self.titlelabel];
    
    self.subTitleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 290, 10)];
    self.subTitleLabel.font      = [UIFont AvenirLightWithFontSize:8.f];
    self.subTitleLabel.textColor = [UIColor grayColor];
    [self addSubview:self.subTitleLabel];
}

- (void)loadContent {
    
    if (self.dataAdapter.data) {
        
        AnimationCellModel *item       = self.dataAdapter.data;
        self.titlelabel.attributedText = item.nameString;
        self.subTitleLabel.text        = [NSString stringWithFormat:@"%@", [item.object class]];
    }
    
    if (self.indexPath.row % 2) {
        
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
        
    } else {
        
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

@end
