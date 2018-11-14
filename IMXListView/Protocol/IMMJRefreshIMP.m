//
//  IMMJRefreshIMP.m
//  DHIMSDK
//
//  Created by zhoupanpan on 2018/10/17.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMMJRefreshIMP.h"
#import <MJRefresh/MJRefresh.h>

@interface IMMJRefreshIMP()
@property (nonatomic,copy)im_refreshBlock pullRefreshBlock;
@end

@implementation IMMJRefreshIMP
- (void)dealloc{
}
#pragma mark - Public
- (void)list:(UIScrollView *)list pullRefresh:(im_refreshBlock)block{
    self.pullRefreshBlock = block;
    if(block){
        if(list.mj_header){
            return;
        }
        __weak __typeof(self) weakSelf = self;
        list.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            __strong __typeof(weakSelf)strongself = weakSelf;
            strongself.pullRefreshBlock();
        }];
        list.mj_header.ignoredScrollViewContentInsetTop = 0;
        MJRefreshNormalHeader *header = (MJRefreshNormalHeader *)list.mj_header;
        header.lastUpdatedTimeLabel.hidden = YES;
        header.arrowView.image = [UIImage imageNamed:@"arrow"];
        
        [header setTitle:NSLocalizedString(@"Release to refresh...", nil) forState:MJRefreshStateIdle];
        [header setTitle:NSLocalizedString(@"Release to refresh...", nil) forState:MJRefreshStatePulling];
        [header setTitle:NSLocalizedString(@"Release to refresh...", nil) forState:MJRefreshStateWillRefresh];
        [header setTitle:NSLocalizedString(@"Loading...", nil) forState:MJRefreshStateRefreshing];
        
        [header setTitle:NSLocalizedString(@"No More...", nil) forState:MJRefreshStateNoMoreData];
    }
    else{
        list.mj_header = nil;
    }
}
- (void)beginPullRefresh:(UIScrollView *)list{
    [list.mj_header beginRefreshing];
}
- (void)endPullRefresh:(UIScrollView *)list{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [list.mj_header endRefreshing];
    });
}
- (void)noticeNoMoreData:(UIScrollView *)list{
    MJRefreshNormalHeader *header = (MJRefreshNormalHeader *)list.mj_header;
    header.state = MJRefreshStateIdle;
}
- (void)resetNoMoreData:(UIScrollView *)list{
    MJRefreshNormalHeader *header = (MJRefreshNormalHeader *)list.mj_header;
    header.state = MJRefreshStateIdle;
}
#pragma mark - Life Cycle

#pragma mark - Delegate

#pragma mark - Event

#pragma mark - Private
- (void)refresh:(UIRefreshControl *)sender{
    self.pullRefreshBlock();
    
    [sender endRefreshing];
}
#pragma mark - Getter & Setter


@end
