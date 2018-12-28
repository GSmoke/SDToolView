//
//  SDToolView.h
//  SDToolView
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SDToolViewType) {
    SDToolViewTypeLabel,        // 选择方式,右侧是个lable
    SDToolViewTypeTextField,    // 输入方式,右侧是个textField
    SDToolViewTypeSwitch,       // 开关方式,右侧是个Switch
    SDToolViewTypeSelect,       // 选择方式,右侧是选择框
};

@class SDToolView;
@protocol SDToolViewDelegate <NSObject>

@optional;
//点击label/文本框结束编辑 按钮不单独接受事件
- (void)toolView:(SDToolView *)toolView textField:(UITextField *)textField lable:(UILabel *)label;

//文本框正在编辑 按钮单独接受事件
- (void)toolView:(SDToolView *)toolView editingTextField:(UITextField *)textField lable:(UILabel *)label;

// 开关响应
- (void)toolView:(SDToolView *)toolView switchState:(BOOL)switchState;
@end




@interface SDToolView : UIView

/**
 初始化

 @param viewType 创建方式
 @param hasArrow 是否有箭头
 @param hasSep 是否有分割线
 */
- (instancetype)initWithViewType:(SDToolViewType)viewType hasArrow:(BOOL)hasArrow hasSep:(BOOL)hasSep;

// toolViewType
@property (nonatomic, assign) SDToolViewType viewType;
// placeLabel/textField的对齐方式,默认值 NSTextAlignmentRight
@property(nonatomic) NSTextAlignment textAlignment;

// 开关
@property (nonatomic, weak) UISwitch *typeSwitch;     /// 默认值为YES
// 设置开关默认状态 不设置为 NO
@property (nonatomic, assign) BOOL typeNormalState;
// 获取当前开关状态
@property (nonatomic, assign) BOOL typeState;
// 左侧的容器view
@property (nonatomic, strong) UIView *leftView;
// view内部偏移 默认值 UIEdgeInsetsMake(0, 15, 0, 15)
@property(nonatomic) UIEdgeInsets contentInset;
// tipLabel与leftView的间隙 默认值 0
@property (nonatomic, assign) CGFloat tipLabelMargin;
// textAlignment为左对齐时有效 placeLabel/textField左侧与leftView左侧的距离 默认值 50
@property (nonatomic, assign) CGFloat placeMaxMargin;
// textAlignment为右对齐时有效 placeLabel/textField左侧与tipLabel右侧的间隙 默认值 10
@property (nonatomic, assign) CGFloat placeMargin;
// 箭头左侧与placeLabel/textField右侧的间隙 默认值 5
@property (nonatomic, assign) CGFloat arrowMargin;


// tipLabel文字颜色 默认值 blackColor
@property (nonatomic, strong) UIColor *tipTextColor;
// tipLabel文字大小 默认值 [UIFont systemFontOfSize:14]
@property (nonatomic, strong) UIFont *tipFont;

// placeLabel/textField占位文字颜色 默认值 [UIColor grayColor]
@property (nonatomic, strong) UIColor *placeholderColor;
// placeLabel/textField文字大小 默认值 [UIFont systemFontOfSize:14]
@property (nonatomic, strong) UIFont *textFont;
// placeLabel/textField正文文字颜色 默认值 [UIColor blackColor]
@property (nonatomic, strong) UIColor *textColor;

// 设置placeLabel/textField默认数据
@property (nonatomic, copy) NSString *text;
// 获取到当前placeLabel/textField的值
@property (nonatomic, copy) NSString *currentText;
// 左侧提示文字
@property (nonatomic, copy) NSString *tipText;
// 右侧提示文字
@property (nonatomic, copy) NSString *placeholder;
// 是否有右侧图片 默认为no
@property (nonatomic, assign) BOOL hasArrow;
// 是否有分割线
@property (nonatomic, assign) BOOL hasSep;
// 右侧按钮图片
@property (nonatomic, strong) UIImage *arrowImage;
// 右侧按钮文字,文字与图片不能共存
@property (nonatomic, copy) NSString *arrowTitle;
// 右侧按钮文字颜色
@property (nonatomic, strong) UIColor *arrowTitleColor;
// 右侧按钮文字大小
@property (nonatomic, strong) UIFont *arrowTitleFont;

// 分割线的颜色 默认值 [UIColor darkGrayColor]
@property (nonatomic, strong) UIColor *sepColor;
// 分割线距离view左侧的间隙 默认值 contentInset.left
@property (nonatomic, assign) CGFloat sepLeftMargin;
// 分割线距离view右侧的间隙 默认值 self.contentInset.right
@property (nonatomic, assign) CGFloat sepRightMargin;
// 分割线的高度 默认值 0.5
@property (nonatomic, assign) CGFloat sepHeight;

// 右侧按钮是否单独接受事件,默认否,即label和buton响应同一代理 默认值 NO
@property (nonatomic, assign) BOOL singleEven;

@property (nonatomic, weak) id<SDToolViewDelegate>delegate;

@end
