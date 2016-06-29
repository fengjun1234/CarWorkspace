//
//  BaseTableViewController.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)loadView {
    [super loadView];
    
    UITableView *tableView = [UITableView new];
    
    tableView.dataSource = self;
    tableView.delegate   = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updata)];
    
    [header.arrowView setImage:[UIImage imageNamed:@"ic_pull_refresh_arrow_22x22_"]];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    tableView.mj_header = header;
    tableView.mj_footer = footer;
    tableView.mj_footer.hidden = YES;
    
    
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    [super setBackItemWithImage:@"ic_nav_back_normal_11x19_" pressImage:@"ic_nav_back_pressed_11x19_"];
    
}


- (void)updata {
    
}

- (void)loadMoreData {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}



@end
