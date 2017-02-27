//
//  yhlTBViewController.h
//  tableViewLibrary
//
//  Created by yangshiyu on 16/5/14.
//  Copyright © 2016年 sean.yang. All rights reserved.
//
#import <YHLTableView/RefreshTableViewController.h>
#import <YHLTableView/YHLTableViewController.h>
/*
    1.获取json数据 <网络请求 缓存读取>
    2.将json解析成item                
    3.根据item封装cellModell          baseCellModel<baseCellModelProtocal>
    4.根据cellModell创建dataSources   baseMutableDataSource>baseDataSource>UITableViewDataSource
    5.刷新tableView                  [self reloadPages:data] >baseTableViewController
 
 */

@interface yhlTBViewController : RefreshTableViewController


@end

