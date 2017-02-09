//
//  baseViewController.m
//  Pods
//
//  Created by yang on 16/6/3.
//
//

#import "baseViewController.h"

@interface baseViewController ()

@end

@implementation baseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self initView];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView
{
    //self.edgesForExtendedLayout = UIRectEdgeNone;
   //self.extendedLayoutIncludesOpaqueBars = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
