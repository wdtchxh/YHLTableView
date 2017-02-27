//
//  yhlTBViewController.m
//  tableViewLibrary
//
//  Created by yangshiyu on 16/5/14.
//  Copyright © 2016年 sean.yang. All rights reserved.
//

#import "yhlTBViewController.h"
#import "baseMutableDataSource.h"
#import "baseCellModel.h"
#import "YHLTableViewController.h"
#import "yhlYWCellModel.h"
#import "yhlData.h"
@interface yhlTBViewController ()

@end

@implementation yhlTBViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    yhlYWCellModel *cellModel=[[yhlYWCellModel alloc] init];
    
    yhlData *item = [[yhlData alloc] init];
    item.title=@"hello world  OH";
    
    if ([cellModel respondsToSelector:@selector(parseItem:)]) {
        [cellModel parseItem:item];
    }
    
    NSArray *sections=@[@""];
    NSArray *items=@[@[cellModel,cellModel,cellModel,cellModel,cellModel,cellModel,cellModel,cellModel,cellModel]];
    
    baseMutableDataSource *data=[[baseMutableDataSource alloc] initWithItems:items sections:sections];
    
    [self reloadPages:nil];
    
    self.didSupportFooterRefreshing=YES;
    [self refreshFooter];
    
   
}

-(void)refreshHeaderDidRefresh:(MJRefreshHeader *)refreshHeader{
    //开始刷新
    NSLog(@"header");
    
    [self endHeaderRefreshing];
}
-(void)refreshFooterDidRefresh:(MJRefreshFooter *)refreshFooter{
    //开始刷新
    NSLog(@"footer");
    
    [self endFooterRefreshing];
    
     [self setRefreshFooterStatus:MSRefreshFooterStatusIdle];
}


@end


