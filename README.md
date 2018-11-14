# IMXListView
ListView:Subclass of UITableView and UICollectionView with refresh function.Some custom cells.

ListView：子类化UITableView和UICollectionView，并添加刷新功能。

## 目录

###### 1. ListView

1. IMXListViewKit：头文件
2. IMXTableView：简单列表UITableView子类，添加上拉、下拉刷新功能。
3. IMXCollectionView：复杂列表UICollectionView子类，添加上拉、下拉刷新功能。

###### 2. IMXReuseUIs：

1. 可选的UITableViewCell基类、UICollectionViewCell基类、ReuseView基类：内涵盖线条添加到方法等。
2. 一些简单的cell子类。


###### 3. Protocol：以协议方式实现list列表控件的上拉、下拉刷新。

1. 上述方案以MJRefresh三方库实现，具有一定的局限性。故此处只设定协议，具体实现交由外部实现。
2. IMMJRefreshIMP：具体实现的实例。
3. 本方案不在IMXLIstView 1.0中，需要更新pods。
4. 使用示例：

	```
	__weak __typeof(self)weakSelf = self;
    [self.refreshIMP list:self.listView pullRefresh:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.interactor loadNextPage];
    }];
	```


## 附

* 另外一个实现方式是将下拉、上拉刷新在listView的扩展中实现。即在扩展中添加属性，执行刷新。参见：[ListDemo](https://github.com/PanZhow/ListDemo)。
