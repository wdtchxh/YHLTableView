//
//  YHLTableEmptyView.m
//  Pods
//
//  Created by yanghonglei on 16/7/12.
//
//

#import "YHLTableEmptyView.h"

@implementation YHLTableEmptyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor lightGrayColor];
        label.text = @"正在加载...";
        label.numberOfLines=0;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        _textlabel = label;
        
        NSString *imageName = [@"YHLTableView.bundle" stringByAppendingPathComponent:@"message_tips_nodata"];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imgv = [[UIImageView alloc] initWithImage:image];
        [label addSubview:imgv];
        imgv.center = CGPointMake(CGRectGetMidX(label.frame), CGRectGetMidY(label.frame) - 20 - imgv.frame.size.height/2);
        
        [self addSubview:imgv];
        _iconImageView = imgv;
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEmptyViewAction:)];
//        [self addGestureRecognizer:tap];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _textlabel.frame = self.bounds;
    _iconImageView.center = CGPointMake(CGRectGetMidX(_textlabel.frame), CGRectGetMidY(_textlabel.frame) - 20 - _iconImageView.frame.size.height/2);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    _textlabel.backgroundColor = backgroundColor;
}


@end
