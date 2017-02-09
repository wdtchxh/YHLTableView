//
//  yhlYWTableViewCell.m
//  tableViewLibrary
//
//  Created by yanghonglei on 16/7/11.
//  Copyright © 2016年 sean.yang. All rights reserved.
//

#import "yhlYWTableViewCell.h"
#import "yhlYWCellModel.h"

@implementation yhlYWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)update:(yhlYWCellModel *)cellModel{
    yhlData *item = cellModel.item;
    self.titleLabel.text=item.title;
}

@end
