//
//  CellDataAdapter.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/25.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CellDataAdapter : NSObject

/**
 *  Cell's reused identifier.
 *  Cell 的重用标记
 */
@property (nonatomic, strong) NSString     *cellReuseIdentifier;

/**
 *  Data, can be nil.
 *  数据  可以为空
 */
@property (nonatomic, strong) id            data;

/**
 *  Cell's height, only used for UITableView's cell.
 *  Cell 的高度 ，仅用于tableviewcell
 */
@property (nonatomic)         CGFloat       cellHeight;

/**
 *  Cell's width, only used for UITableView's cell.
 *  Cell 的宽度， 仅用于tableviewcell
 */
@property (nonatomic)         CGFloat       cellWidth;

/**
 *  Cell's type (The same cell, but maybe have different types).
 *  Cell 的类型  (同样的cell。可能有不同的类型)
 */
@property (nonatomic)         NSInteger     cellType;

/**
 *  CellDataAdapter's convenient method, used for UITableView.
 *
 *  @param cellReuseIdentifiers Cell's reused identifier.
 *  @param data                 Data, can be nil.
 *  @param cellHeight           Cell's height.
 *  @param cellType             Cell's type (The same cell, but maybe have different types).
 *
 *  @return CellDataAdapter's object.
 */
+ (CellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                                 cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType;

/**
 *  CellDataAdapter's convenient method, used for UITableView.
 *
 *  @param cellReuseIdentifiers Cell's reused identifier.
 *  @param data                 Data, can be nil.
 *  @param cellHeight           Cell's height.
 *  @param cellWidth            Cell's width.
 *  @param cellType             Cell's type (The same cell, but maybe have different types).
 *
 *  @return CellDataAdapter's object.
 */
+ (CellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                                 cellHeight:(CGFloat)cellHeight cellWidth:(CGFloat)cellWidth
                                                   cellType:(NSInteger)cellType;

/**
 *  CellDataAdapter's convenient method, used for UICollectionView.
 *
 *  @param cellReuseIdentifiers Cell's reused identifier.
 *  @param data                 Data, can be nil.
 *  @param cellType             Cell's type (The same cell, but maybe have different types).
 *
 *  @return CellDataAdapter's object.
 */
+ (CellDataAdapter *)collectionCellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                                             cellType:(NSInteger)cellType;

#pragma mark - Optional properties.

/**
 *  The tableView.
 */
@property (nonatomic, weak)   UITableView       *tableView;

/**
 *  The collectionView.
 */
@property (nonatomic, weak)   UICollectionView  *collectionView;

/**
 *  TableView's indexPath.
 */
@property (nonatomic, weak)   NSIndexPath       *indexPath;
@end
