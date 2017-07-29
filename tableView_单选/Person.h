//
//  Person.h
//  tableView_单选
//
//  Created by hc on 2017/7/29.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(copy,nonatomic)NSString *title;//cell上的textLabel数据
@property(copy,nonatomic)NSString *detail;//cell上的detailLabel数据
@property(assign,nonatomic)BOOL ifSelected;//是否选中

@end
