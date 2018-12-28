//
//  ViewController.m
//  SDToolViewDemo
//
//  Created by apple on 2018/12/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

#import "SDSingleDemoCtrl.h"
#import "SDTestCtrl.h"

static NSString *SD_GROUP_NAME = @"SD_GROUP_NAME";
static NSString *SD_GROUP = @"SD_GROUP";
static NSString *SD_NAV_NAME = @"SD_NAV_NAME";
static NSString *SD_NAV_SELECTOR = @"SD_NAV_SELECTOR";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - 跳转
- (void)enterSingleDemoCtrlType:(NSNumber *)ctrlType
{
    SDSingleDemoCtrl *ctrl = [[SDSingleDemoCtrl alloc] initWithCtrlType:[ctrlType integerValue]];
    [self.navigationController pushViewController:ctrl animated:YES];
}
- (void)enterTestDemoCtrl
{
    SDTestCtrl *ctrl = [[SDTestCtrl alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}

#pragma mark - UITableView数据源 & 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *group_dict = self.dataArray[section];
    NSArray *array = group_dict[SD_GROUP];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *group_dict = self.dataArray[indexPath.section];
    NSArray *array = group_dict[SD_GROUP];
    NSDictionary *dict = array[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = dict[SD_NAV_NAME];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *group_dict = self.dataArray[indexPath.section];
    NSArray *array = group_dict[SD_GROUP];
    NSDictionary *dict = array[indexPath.row];
    
    SEL sel = NSSelectorFromString(dict[SD_NAV_SELECTOR]);
    
    if ([self respondsToSelector:sel]) {
        [self performSelector:sel withObject:@(indexPath.item)];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *group_dict = self.dataArray[section];
    return group_dict[SD_GROUP_NAME];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.font = SYS_FONT(15);
    header.textLabel.textColor = UIColorFromRGB(0x666666);
    header.contentView.backgroundColor = bgBlueColor;
}


#pragma mark - 懒加载

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@{SD_GROUP_NAME:@"SXToolView",
                         SD_GROUP : @[@{SD_NAV_NAME: @"SXToolView-ALL",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"Label-00-默认形式",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"Label-05-底部分割线/默认数据",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"Label-10-文字大小/颜色/间距",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"Label-20-左侧view 间隙 右侧button",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"Label-25-对齐方式",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"TextField-30-默认",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"TextField-35-右侧button的Ttile",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"TextField-40-右侧button signleEven",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"TextField-45-对齐方式",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))},
                                      @{SD_NAV_NAME: @"Switch-50",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterSingleDemoCtrlType:))}]},
                       @{SD_GROUP_NAME:@"Test",
                         SD_GROUP : @[@{SD_NAV_NAME: @"Test",
                                        SD_NAV_SELECTOR: NSStringFromSelector(@selector(enterTestDemoCtrl))}]}];
    }
    return _dataArray;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CJ_StatusBarAndNavigationBarHeight, SCREEN_W, SCREEN_H - CJ_StatusBarAndNavigationBarHeight) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 54;
        _tableView.sectionHeaderHeight = 40;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tableView;
}

@end
