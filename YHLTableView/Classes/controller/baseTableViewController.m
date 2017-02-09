//
//  baseTableViewController.m
//  Pods
//
//  Created by yangshiyu on 16/5/14.
//
//

#import "baseTableViewController.h"
#import "baseMutableDataSource.h"
#import "baseCellModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "CellUpdating.h"

@interface baseTableViewController ()

@end

@implementation baseTableViewController

- (UITableView *)tableView
{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIView *)emptyView{
    if (_emptyView==nil) {
        _emptyView=[[UIView alloc] initWithFrame:self.view.bounds];
        
        UILabel *lbl =[[UILabel alloc] initWithFrame:_emptyView.bounds];
        lbl.text=@"暂无数据";
        lbl.textAlignment=NSTextAlignmentCenter;
        [_emptyView addSubview:lbl];
        
        _emptyView.backgroundColor=[UIColor whiteColor];
    }
    return _emptyView;
}

-(void)loadView{
    [super loadView];
    [self.view addSubview:[self tableView]];
}

- (void)reloadPages:(baseMutableDataSource *)dataSource
{
    if ([dataSource isEmpty]||dataSource==nil) {
        [self.view addSubview:self.emptyView];
        [self.view bringSubviewToFront:self.emptyView];
    }else{
        [self.emptyView removeFromSuperview];
        self.dataSource = dataSource;
        self.tableView.dataSource = dataSource;
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    if ( [self isViewLoaded] && nil == self.view.window)
    {
        self.tableView=nil;
        self.emptyView=nil;
        self.view = nil;
    }
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *items = [self.dataSource.items objectAtIndex:indexPath.section];
    id<baseCellModelProtocal> item = [items objectAtIndex:indexPath.row];
    CGFloat height = item.height;
    //存在
    if (height >0) {
        return height;
    }
    //不存在
    if (self.isAutolayout) {
        height = [tableView fd_heightForCellWithIdentifier:item.reuseIdentify cacheByIndexPath:indexPath configuration:^(id cell) {
            if ([cell respondsToSelector:@selector(update:indexPath:)]) {
                [cell update:item indexPath:indexPath];
            }
            else if ([cell respondsToSelector:@selector(update:)]) {
                [cell update:item];
            }
        }];
    }else{
        if ([item respondsToSelector:@selector(calculateHeight)]) {
            height = [item calculateHeight];
        }
    }
    
    
    return height;
}

@end
