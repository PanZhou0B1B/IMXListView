//
//  IMRefreshProtocol.h
//  DHIMSDK
//
//  Created by zhoupanpan on 2018/10/17.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIkit.h>
/**
 针对给定listview 执行刷新操作
 */
typedef void (^im_refreshBlock)(void);

@protocol IMRefreshProtocol <NSObject>
@required
- (void)list:(UIScrollView *)list pullRefresh:(im_refreshBlock)block;

- (void)beginPullRefresh:(UIScrollView *)list;
- (void)endPullRefresh:(UIScrollView *)list;

@optional
- (void)list:(UIScrollView *)list loadMore:(im_refreshBlock)block;
- (void)endPullLoadmore:(UIScrollView *)list;

- (void)noticeNoMoreData:(UIScrollView *)list;
- (void)resetNoMoreData:(UIScrollView *)list;
- (BOOL)isPulling:(UIScrollView *)list;
@end
