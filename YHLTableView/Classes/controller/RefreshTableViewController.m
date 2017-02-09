//
//  RefreshTableViewController.m
//  Pods
//
//  Created by yanghonglei on 16/7/12.
//
//

#import "RefreshTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface RefreshTableViewController ()

@property (nonatomic, strong, readwrite) MJRefreshHeader *refreshHeader;
@property (nonatomic, strong, readwrite) MJRefreshFooter *refreshFooter;

@end

@implementation RefreshTableViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.didSupportHeaderRefreshing = YES;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.didSupportHeaderRefreshing = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshHeader];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self headerRefreshingWhenViewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self headerRefreshingWhenViewDidAppear:animated];
}

- (void)headerRefreshingWhenViewWillAppear:(BOOL)animated
{
    //子类自己实现
}
- (void)headerRefreshingWhenViewDidAppear:(BOOL)animated
{
    //子类自己实现
}

- (void)refreshHeaderDidRefresh:(MJRefreshHeader *)refreshHeader {
    //子类自己实现
}
- (void)refreshFooterDidRefresh:(MJRefreshFooter *)refreshFooter
{
    //子类自己实现
}

- (MJRefreshHeader *)refreshHeader
{
    if (!_refreshHeader && self.didSupportHeaderRefreshing)
    {
        _refreshHeader = [self refreshHeaderOfTableView];
        [self applyEMRefreshStyle:(MJRefreshGifHeader *)_refreshHeader];
    }
    
    if (self.tableView.mj_header != _refreshHeader)
    {
        self.tableView.mj_header = _refreshHeader;
    }
    return _refreshHeader;
}

- (MJRefreshHeader *)refreshHeaderOfTableView
{
    __weak __typeof(self)weakSelf = self;
    
    return [MJRefreshGifHeader headerWithRefreshingBlock:^(){
        [weakSelf refreshHeaderDidRefresh:weakSelf.refreshHeader];
    }];
}

- (void)beginHeaderRefreshing
{
    [self.refreshHeader beginRefreshing];
}

- (void)endHeaderRefreshing
{
    [self.refreshHeader endRefreshing];
}

#pragma mark footer
- (MJRefreshFooter *)refreshFooter
{
    if (!_refreshFooter && self.didSupportFooterRefreshing){
        _refreshFooter = [self refreshFooterOfTableView];
    }
    
    if (self.tableView.mj_footer != _refreshFooter) {
        self.tableView.mj_footer = _refreshFooter;
    }
    return _refreshFooter;
}


- (MJRefreshFooter *)refreshFooterOfTableView
{
    __weak __typeof(self)weakSelf = self;
    //  MJRefreshBackNormalFooter
    return  [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^(){
        [weakSelf refreshFooterDidRefresh:weakSelf.refreshFooter];
    }];
    
}

- (void)beginFooterRefreshing
{
    [self.refreshFooter beginRefreshing];
}


- (void)endFooterRefreshing
{
    [self.refreshFooter endRefreshing];
}

- (void)setRefreshFooterStatus:(MSRefreshFooterStatus)status
{
    if (status == MSRefreshFooterStatusIdle) {
        self.refreshFooter.hidden = NO;
        [self.refreshFooter resetNoMoreData];
    }
    else if (status == MSRefreshFooterStatusNoMoreData) {
        self.refreshFooter.hidden = NO;
        [self.refreshFooter endRefreshingWithNoMoreData];
    }
    else if (status == MSRefreshFooterStatusHidden) {
        [self.refreshFooter setHidden:YES];
    }
}

- (MSRefreshFooterStatus)refreshFooterStatus
{
    if (_refreshFooter.hidden) {
        return MSRefreshFooterStatusHidden;
    }
    else if (_refreshFooter.state == MJRefreshStateNoMoreData) {
        return MSRefreshFooterStatusNoMoreData;
    }
    
    return MSRefreshFooterStatusIdle;
}

- (void)applyEMRefreshStyle:(MJRefreshGifHeader *) MJheader{
    NSString *imageName1 = [NSString stringWithFormat:@"tableViewLibrary.bundle/%@",@"refreshHeader_img_1"];
    NSString *imageName2 = [NSString stringWithFormat:@"tableViewLibrary.bundle/%@",@"refreshHeader_img_2"];
    NSString *imageName3 = [NSString stringWithFormat:@"tableViewLibrary.bundle/%@",@"refreshHeader_img_3"];
    
    NSArray *imageNames = @[imageName1, imageName2, imageName3];
    NSMutableArray *images = [NSMutableArray array];
    
    for (NSString *name in imageNames) {
        UIImage *img = [UIImage imageNamed:name];
        [images addObject:img];
    }
    
    [MJheader setImages:images forState:MJRefreshStateIdle];
    [MJheader setImages:images forState:MJRefreshStatePulling];
    [MJheader setImages:images forState:MJRefreshStateRefreshing];
    [MJheader setImages:images forState:MJRefreshStateWillRefresh];
    
    MJheader.stateLabel.textColor = [UIColor grayColor];
    
    [MJheader setTitle:@"下拉刷新..." forState:MJRefreshStateIdle];
    [MJheader setTitle:@"松开刷新..." forState:MJRefreshStatePulling];
    [MJheader setTitle:@"玩命刷新中..." forState:MJRefreshStateRefreshing];
    
    MJheader.lastUpdatedTimeLabel.hidden = YES;

}

@end
