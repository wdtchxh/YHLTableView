//
//  RefreshTableViewController.h
//  Pods
//
//  Created by yanghonglei on 16/7/12.
//
//

#import "baseTableViewController.h"

#import "MJRefresh.h"


@protocol MSRefreshProtocol <NSObject>

@required

// 触发下拉刷新操作(动画)调用
- (void)refreshHeaderDidRefresh:(MJRefreshHeader *)refreshHeader;

// 底部上拉刷新触发时调用
- (void)refreshFooterDidRefresh:(MJRefreshFooter *)refreshFooter;

/**
 *  viewwillappear\viewdidappear 的时候调用，供子类调用刷新数据
 *  @param animated animated description
 */
- (void)headerRefreshingWhenViewWillAppear:(BOOL)animated;
- (void)headerRefreshingWhenViewDidAppear:(BOOL)animated;

// 自定义refresh header & footer
- (MJRefreshHeader *)refreshHeaderOfTableView;
- (MJRefreshFooter *)refreshFooterOfTableView;

@end

typedef enum : NSUInteger {
    MSRefreshFooterStatusIdle,        // 闲置状态, 等待下次上拉
    MSRefreshFooterStatusNoMoreData,  // 没有更多
    MSRefreshFooterStatusHidden,      // 隐藏
    
} MSRefreshFooterStatus;

@interface RefreshTableViewController : baseTableViewController<MSRefreshProtocol>


@property (nonatomic, assign) BOOL didSupportHeaderRefreshing;// default is yes
@property (nonatomic, assign) BOOL didSupportFooterRefreshing;//default is no

@property (nonatomic, strong, readonly) MJRefreshHeader *refreshHeader;
@property (nonatomic, strong, readonly) MJRefreshFooter *refreshFooter;

- (void)beginHeaderRefreshing; // 手动调用 下拉刷新动作 有动画
- (void)endHeaderRefreshing; // 结束刷新状态

- (void)beginFooterRefreshing; // 上拉 有动画
- (void)endFooterRefreshing;

- (void)setRefreshFooterStatus:(MSRefreshFooterStatus)status; // 设置footer状态
- (MSRefreshFooterStatus)refreshFooterStatus;

@end
