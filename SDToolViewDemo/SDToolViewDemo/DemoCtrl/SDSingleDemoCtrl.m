//
//  SDSingleDemoCtrl.m
//  SDToolView
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SDSingleDemoCtrl.h"
#import "SDToolView.h"

typedef NS_ENUM(NSUInteger, ToolViewTag) {
    ToolView00,
    ToolView05,
    ToolView10,
    ToolView20,
    ToolView25,
    ToolView30,
    ToolView35,
    ToolView40,
    ToolView45,
    ToolView50,
};
@interface SDSingleDemoCtrl ()<SDToolViewDelegate>
@property (nonatomic, strong) SDToolView *toolView00;
@property (nonatomic, strong) SDToolView *toolView05;
@property (nonatomic, strong) SDToolView *toolView10;
@property (nonatomic, strong) SDToolView *toolView20;
@property (nonatomic, strong) SDToolView *toolView25;
@property (nonatomic, strong) SDToolView *toolView30;
@property (nonatomic, strong) SDToolView *toolView35;
@property (nonatomic, strong) SDToolView *toolView40;
@property (nonatomic, strong) SDToolView *toolView45;
@property (nonatomic, strong) SDToolView *toolView50;


@property (nonatomic, assign) CtrlType ctrlType;
@end

@implementation SDSingleDemoCtrl

- (instancetype)initWithCtrlType:(CtrlType)ctrlType
{
    self = [super init];
    if (self) {
        self.ctrlType = ctrlType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"SXToolView单独使用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.ctrlType == CtrlTypeLabel00) {
        
        self.toolView00.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView00];
        
    }else if (self.ctrlType == CtrlTypeLabel05){
        
        self.toolView05.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView05];
        
    } else if (self.ctrlType == CtrlTypeLabel10){
        
        self.toolView10.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView10];
    
    }else if (self.ctrlType == CtrlTypeLabel20){
    
        self.toolView20.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView20];
    }else if (self.ctrlType == CtrlTypeLabel25){
        
        self.toolView25.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView25];
    }else if (self.ctrlType == CtrlTypeLabel30){
        
        self.toolView30.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView30];
        
    }else if (self.ctrlType == CtrlTypeLabel35){
        
        self.toolView35.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView35];
        
    }else if (self.ctrlType == CtrlTypeLabel40){
        
        self.toolView40.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView40];
        
    }else if (self.ctrlType == CtrlTypeLabel45){
        
        self.toolView45.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView45];
        
    }else if (self.ctrlType == CtrlTypeLabel50){
        
        self.toolView50.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 40, SCREEN_W, 49);
        [self.view addSubview:self.toolView50];
        
    }else if (self.ctrlType == CtrlTypeAll){
        
        self.toolView00.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView00];
        
        self.toolView05.frame = CGRectMake(0, CGRectGetMaxY(self.toolView00.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView05];
        
        self.toolView10.frame = CGRectMake(0, CGRectGetMaxY(self.toolView05.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView10];
        
        self.toolView20.frame = CGRectMake(0, CGRectGetMaxY(self.toolView10.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView20];
        
        self.toolView25.frame = CGRectMake(0, CGRectGetMaxY(self.toolView20.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView25];
        
        self.toolView30.frame = CGRectMake(0, CGRectGetMaxY(self.toolView25.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView30];
        
        self.toolView35.frame = CGRectMake(0, CGRectGetMaxY(self.toolView30.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView35];
        
        self.toolView40.frame = CGRectMake(0, CGRectGetMaxY(self.toolView35.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView40];
        
        self.toolView45.frame = CGRectMake(0, CGRectGetMaxY(self.toolView40.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView45];
        
        self.toolView50.frame = CGRectMake(0, CGRectGetMaxY(self.toolView45.frame) + 5, SCREEN_W, 49);
        [self.view addSubview:self.toolView50];
        
        
    }
    
    
}
//点击label/文本框结束编辑 按钮不单独接受事件
- (void)toolView:(SDToolView *)toolView textField:(UITextField *)textField lable:(UILabel *)label
{
    NSInteger tag = toolView.tag;
    switch (tag) {
        case ToolView00:{
            NSLog(@"点击了toolView00");
    
            break;
        }
        case ToolView05:{
            NSLog(@"点击了toolView05");
            break;
        }
        case ToolView10:{
            NSLog(@"点击了toolView10");
            break;
        }
        case ToolView20:{
            NSLog(@"点击了toolView20");
            break;
        }
            
        case ToolView25:{
            NSLog(@"点击了toolView25");
            break;
        }
        case ToolView30:{
            NSLog(@"%@",textField.text);
            
            break;
        }
        case ToolView35:{
            NSLog(@"%@",textField.text);
            break;
        }
            
        case ToolView40:{
            NSLog(@"%@",textField.text);
            break;
        }
        case ToolView45:{
            NSLog(@"%@",textField.text);
            break;
        }
        default:
            break;
    }
}

- (void)toolView:(SDToolView *)toolView editingTextField:(UITextField *)textField lable:(UILabel *)label
{
    NSInteger tag = toolView.tag;
    switch (tag) {
        case ToolView30:{
            NSLog(@"%@",textField.text);
            
            break;
        }
        case ToolView35:{
            NSLog(@"%@",textField.text);
            break;
        }
        case ToolView40:{
            NSLog(@"点击了toolView40的button");
            NSLog(@"%@",textField.text);
            break;
        }
        case ToolView45:{
            NSLog(@"%@",textField.text);
            break;
        }
        default:
            break;
    }
}

- (void)toolView:(SDToolView *)toolView switchState:(BOOL)switchState
{
    NSLog(@"%d",switchState);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc");
    
}

#pragma mark - lazy
// 开关模式
- (SDToolView *)toolView50
{
    if (_toolView50 == nil) {
        _toolView50 = [[SDToolView alloc] initWithViewType:SDToolViewTypeSwitch hasArrow:NO hasSep:YES];
        _toolView50.backgroundColor = bgBlueColor;
        _toolView50.tipText = @"接受通知";
        _toolView50.tag = ToolView50;
        _toolView50.delegate = self;
        _toolView50.typeNormalState = YES;
    }
    return _toolView50;
}
// 输入框左对齐
- (SDToolView *)toolView45
{
    if (_toolView45 == nil) {
        _toolView45 = [[SDToolView alloc] initWithViewType:SDToolViewTypeTextField hasArrow:NO hasSep:YES];
        _toolView45.backgroundColor = bgBlueColor;
        // 左侧的容器view
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 20)];
        imageView.image = [UIImage imageNamed:@"phone"];
        _toolView45.leftView = imageView;
        
        _toolView45.placeholder = @"请输入手机号";
        _toolView45.textAlignment = NSTextAlignmentLeft;
        _toolView45.placeMaxMargin = 50;
        
        
        _toolView45.tag = ToolView45;
        _toolView45.delegate = self;
    }
    return _toolView45;
}
// 右侧按钮单独接受事件,可输入可选择
- (SDToolView *)toolView40
{
    if (_toolView40 == nil) {
        _toolView40 = [[SDToolView alloc] initWithViewType:SDToolViewTypeTextField hasArrow:YES hasSep:YES];

        _toolView40.backgroundColor = bgBlueColor;
        _toolView40.tipText = @"客户";
        _toolView40.placeholder = @"请选择或填写客户";

        _toolView40.arrowImage = [UIImage imageNamed:@"customer_add"];
        _toolView40.arrowMargin = 10;
        
        _toolView40.singleEven = YES;   // 右侧按钮是否单独接受事件,默认否,即label和buton响应同一代理 默认值 NO
        
        _toolView40.tag = ToolView40;
        _toolView40.delegate = self;
    }
    return _toolView40;
}

// 输入框 带后面单位
- (SDToolView *)toolView35
{
    if (_toolView35 == nil) {
        _toolView35 = [[SDToolView alloc] initWithViewType:SDToolViewTypeTextField hasArrow:YES hasSep:YES];

        _toolView35.backgroundColor = bgBlueColor;
        _toolView35.tipText = @"单价";
        _toolView35.placeholder = @"请输入单价";
        _toolView35.arrowTitle = @"¥";
        _toolView35.arrowTitleFont = [UIFont systemFontOfSize:16];
        _toolView35.arrowTitleColor = [UIColor redColor];
        _toolView35.arrowMargin = 10;
        
        _toolView35.tag = ToolView35;
        _toolView35.delegate = self;
    }
    return _toolView35;
}
// 输入框模式
- (SDToolView *)toolView30
{
    if (_toolView30 == nil) {
        _toolView30 = [[SDToolView alloc] initWithViewType:SDToolViewTypeTextField hasArrow:NO hasSep:YES];
        _toolView30.backgroundColor = bgBlueColor;
        _toolView30.tipText = @"商品名";
        _toolView30.placeholder = @"请输入商品名";
        
        _toolView30.tag = ToolView30;
        _toolView30.delegate = self;
    }
    return _toolView30;
}

// 左对齐
- (SDToolView *)toolView25
{
    if (_toolView25 == nil) {
        _toolView25 = [[SDToolView alloc] initWithViewType:SDToolViewTypeLabel hasArrow:NO hasSep:YES];
        _toolView25.backgroundColor = bgBlueColor;
        _toolView25.tipText = @"订单号";
        _toolView25.text = @"KD20181225";
        _toolView25.textAlignment = NSTextAlignmentLeft;    // placeLabel/textField的对齐方式,默认值 NSTextAlignmentRight
        _toolView25.placeMaxMargin = 110;   // textAlignment为左对齐时有效 placeLabel/textField左侧与leftView左侧的距离 默认值 50
        
        _toolView25.tag = ToolView25;
        _toolView25.delegate = self;
    }
    return _toolView25;
}


// 设置左侧view 间隙 设置右侧button文字
- (SDToolView *)toolView20
{
    if (_toolView20 == nil) {
        _toolView20 = [[SDToolView alloc] initWithViewType:SDToolViewTypeLabel hasArrow:YES hasSep:NO];

        _toolView20.backgroundColor = bgBlueColor;
        _toolView20.tipText = @"规格";
        _toolView20.placeholder = @"请选择规格";
        
        // 左侧的容器view
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 20)];
        imageView.image = [UIImage imageNamed:@"password"];
        _toolView20.leftView = imageView;
        
        _toolView20.arrowTitle = @"Cm";     // 右侧按钮文字,文字与图片不能共存
        _toolView20.arrowTitleFont = [UIFont systemFontOfSize:15];  // 右侧按钮文字大小
        _toolView20.arrowTitleColor = [UIColor redColor];   // 右侧按钮文字颜色
        
        _toolView20.tipLabelMargin = 10;    // tipLabel与leftView的间隙 默认值 0

        _toolView20.arrowMargin = 10;
        
        _toolView20.tag = ToolView20;
        _toolView20.delegate = self;
    }
    return _toolView20;
}
// 设置tipLabel placeLabel 文字大小 文字颜色 间距
- (SDToolView *)toolView10
{
    if (_toolView10 == nil) {
        _toolView10 = [[SDToolView alloc] initWithViewType:SDToolViewTypeLabel hasArrow:YES hasSep:YES];
        
        _toolView10.backgroundColor = bgBlueColor;
        _toolView10.arrowImage = [UIImage imageNamed:@"tool_arrow"];    // 右侧按钮图片
        _toolView10.tipText = @"货币类型";
        
        _toolView10.tipTextColor = [UIColor orangeColor];   // tipLabel文字颜色 默认值 blackColor
        _toolView10.tipFont = [UIFont systemFontOfSize:15]; // tipLabel文字大小 默认值 [UIFont systemFontOfSize:14]
        _toolView10.placeholder = @"请选择货币类型";
        _toolView10.textFont = [UIFont systemFontOfSize:15]; // placeLabel/textField文字大小 默认值 [UIFont systemFontOfSize:14]
        _toolView10.placeholderColor = [UIColor redColor];   // placeLabel/textField占位文字颜色 默认值 [UIColor grayColor]
        
        _toolView10.placeMargin = 20;    // textAlignment为右对齐时有效 placeLabel/textField左侧与tipLabel右侧的间隙 默认值 10
        _toolView10.arrowMargin = 10;    // 箭头左侧与placeLabel/textField右侧的间隙 默认值 5
        
        _toolView10.tag = ToolView10;
        _toolView10.delegate = self;
    }
    return _toolView10;
}

// 设置底部分割线 以及 设置placeLabel/textField默认数据
- (SDToolView *)toolView05
{
    if (_toolView05 == nil) {
        _toolView05 = [[SDToolView alloc] initWithViewType:SDToolViewTypeLabel hasArrow:NO hasSep:YES];
        
        _toolView05.backgroundColor = bgBlueColor;
        _toolView05.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);  // view内部偏移 默认值 UIEdgeInsetsMake(0, 15, 0, 15)
        _toolView05.tipText = @"订单号";
        _toolView05.text = @"系统自动生成";   // // 设置placeLabel/textField默认数据
        
        // 设置底部分割线
        _toolView05.sepLeftMargin = 0;  // 分割线距离view左侧的间隙 默认值 contentInset.left
        _toolView05.sepRightMargin = 0; // 分割线距离view右侧的间隙 默认值 self.contentInset.right
        _toolView05.sepColor = [UIColor redColor];  // 分割线的颜色 默认值 [UIColor darkGrayColor]
        _toolView05.sepHeight = 1;  // 分割线的高度 默认值 0.5
        
        _toolView05.tag = ToolView05;
        _toolView05.delegate = self;
    }

    return _toolView05;
}

// 默认形式
- (SDToolView *)toolView00
{
    if (_toolView00 == nil) {
        _toolView00 = [[SDToolView alloc] initWithViewType:SDToolViewTypeLabel hasArrow:NO hasSep:YES];
        //        _toolView00.hasArrow = NO;
        _toolView00.backgroundColor = bgBlueColor;
        _toolView00.tipText = @"订单号";    // 左侧提示文字
        _toolView00.placeholder = @"20181225-01";   // 右侧提示文字
        
        _toolView00.tag = ToolView00;
        _toolView00.delegate = self;
        
    }
    return _toolView00;
}


@end
