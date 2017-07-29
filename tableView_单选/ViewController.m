//
//  ViewController.m
//  tableView_单选
//
//  Created by hc on 2017/7/29.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *marr;//数据来源
@property(strong,nonatomic)NSIndexPath *lastSelected;//上一次选中的额索引
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _marr = [[NSMutableArray alloc]init];
    for (int i=0; i<100; i++)//产生大量假数据,使用系统的Cell
    {
        Person *p = [[Person alloc]init];
        p.title = [NSString stringWithFormat:@"%iTitle",i];
        p.detail = [NSString stringWithFormat:@"%iDetail",i];
        p.ifSelected = NO;//是否被选中,默认都是NO
        [_marr addObject:p];
    }
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _marr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    
//    cell.textLabel.text = @"111";
//    
//    return cell;
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Person *p = _marr[indexPath.row];
    cell.textLabel.text = p.title;//cell上的title显示
    cell.detailTextLabel.text = p.detail;
    //以下为关键代码1
    if(p.ifSelected)//是否选中,如果为YES则标记
        cell.accessoryType = UITableViewCellAccessoryCheckmark;//勾标记
    else cell.accessoryType = UITableViewCellAccessoryNone;//不标记
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *temp = self.lastSelected;//暂存上一次选中的行
    if(temp && temp!=indexPath)//如果上一次的选中的行存在,并且不是当前选中的这一样,则让上一行不选中
    {
        Person *tp = _marr[temp.row];
        tp.ifSelected = NO;//修改之前选中的cell的数据为不选中
        [tableView reloadRowsAtIndexPaths:@[temp] withRowAnimation:UITableViewRowAnimationAutomatic];//刷新该行
    }
    self.lastSelected = indexPath;//选中的修改为当前行
    Person *p = _marr[indexPath.row];
    p.ifSelected = YES;//修改这个被选中的一行choon
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];//重新刷新这一行
}

















@end
