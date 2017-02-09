//
//  baseTableViewController.h
//  Pods
//
//  Created by yangshiyu on 16/5/14.
//
//

#import "baseViewController.h"

@class baseMutableDataSource;

@interface baseTableViewController : baseViewController<UITableViewDelegate>

/**
 *  是否采用layout计算cell高度
 */
@property (nonatomic, assign) BOOL isAutolayout;

/**
 *  tableview
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  数据源
 */
@property (nonatomic, strong) baseMutableDataSource *dataSource;

/**
 *  空视图, 默认会有一个空视图
 */
@property (nonatomic, strong) UIView *emptyView;


/**
 *  重新加载列表界面
 *
 *  @param dataSource 数据源
 */
- (void)reloadPages:(baseMutableDataSource *)dataSource;
@end
