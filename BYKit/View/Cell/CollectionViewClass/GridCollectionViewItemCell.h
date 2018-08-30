//
//  GridCollectionViewItemCell.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/27.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface GridItemModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)gridItemModelWithTitle:(NSString *)title icon:(NSString *)icon;

@end

@interface GridCollectionViewItemCell : BaseCollectionViewCell

@end
