//
//  yhlYWCellModel.m
//  tableViewLibrary
//
//  Created by yang on 16/6/3.
//  Copyright © 2016年 sean.yang. All rights reserved.
//

#import "yhlYWCellModel.h"
#import "yhlYWTableViewCell.h"
@implementation yhlYWCellModel

- (instancetype)init {
    if (self = [super init]) {
        self.Class             = [yhlYWTableViewCell class];
        self.height            = 80;
        self.reuseIdentify     = @"yhlYWTableViewCell";
        self.isRegisterByClass = NO;
    }
    return self;
}

- (void)parseItem:(yhlData *)item{
    _item=item;
}
@end
