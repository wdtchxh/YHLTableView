//
//  CellUpdating.h
//  Pods
//
//  Created by yang on 16/6/3.
//
//

#import <UIKit/UIKit.h>
#import "baseCellModel.h"

/**
 *  cell需要实现的一个 更新界面的接口
 */
@protocol CellUpdating

@required

/**
 *  更新cell的界面中的内容
 *
 *  @param cellModel cell中显示的数据
 */
- (void)update:(id<baseCellModelProtocal>)cellModel;

@optional
- (void)update:(id<baseCellModelProtocal>)cellModel indexPath:(NSIndexPath *)indexPath;


@end
