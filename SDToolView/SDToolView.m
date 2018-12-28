//
//  SDToolView.m
//  SDToolView
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SDToolView.h"
#import "UIButton+Region.h"
@interface SDToolView ()
@property (nonatomic, strong) UILabel *tipLabel;        // 左侧的提示文字
@property (nonatomic, weak) UITextField *textField;     // 右侧的输入框
@property (nonatomic, weak) UILabel *placeLabel;        // 右侧的文字
@property (nonatomic, weak) UIButton *button;           // 右侧箭头
@property (nonatomic, weak) UIView *sepView;            // 底部的分割线
@end

@implementation SDToolView

- (instancetype)initWithViewType:(SDToolViewType)viewType hasArrow:(BOOL)hasArrow hasSep:(BOOL)hasSep
{
    self = [super init];
    if (self) {
        
        self.viewType = viewType;
        self.hasArrow = hasArrow;
        self.hasSep = hasSep;
        [self initialization];
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self initialization];
        [self setupUI];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

#pragma mark - 初始化数据
- (void)initialization
{
    self.contentInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.tipTextColor = [UIColor blackColor];
    self.tipFont = [UIFont systemFontOfSize:14];
    
    self.tipLabelMargin = 0;
    self.textAlignment = NSTextAlignmentRight;
    self.placeMargin = 10;
    self.placeMaxMargin = 50;
    
    self.placeholderColor = [UIColor grayColor];
    self.textFont = [UIFont systemFontOfSize:14];

    self.arrowMargin = 5;
    self.arrowTitleFont = [UIFont systemFontOfSize:14];
    self.arrowTitleColor = [UIColor grayColor];

    self.sepHeight = 0.5;
    self.sepColor = [UIColor darkGrayColor];
    
    self.textColor = [UIColor blackColor];
    
    self.singleEven = NO;
}

#pragma mark - 代理事件
- (void)textDidEndChange:(UITextField *)textField
{
    if (_delegate && [_delegate respondsToSelector:@selector(toolView:textField:lable:)]) {
        [_delegate toolView:self textField:textField lable:nil];
    }
}
- (void)textChange:(UITextField *)textField
{
    self.currentText = textField.text;
    if (_delegate && [_delegate respondsToSelector:@selector(toolView:editingTextField:lable:)]) {
        [_delegate toolView:self editingTextField:textField lable:nil];
    }
}

- (void)tagAction:(UIGestureRecognizer *)gesture
{
    UILabel *lable = (UILabel *)gesture.view;
    if (_delegate && [_delegate respondsToSelector:@selector(toolView:textField:lable:)]) {
        [_delegate toolView:self textField:nil lable:lable];
    }
}

- (void)arrowAction
{
    if (self.singleEven) {
        if (_delegate && [_delegate respondsToSelector:@selector(toolView:editingTextField:lable:)]) {
            [_delegate toolView:self editingTextField:self.textField lable:self.placeLabel];
        }
    }else{
        if (_delegate && [_delegate respondsToSelector:@selector(toolView:textField:lable:)]) {
            [_delegate toolView:self textField:self.textField lable:self.placeLabel];
        }
    }
}

- (void)typeSwitchAction:(UISwitch *)sender
{
    self.typeState = sender.isOn;
    if (_delegate && [_delegate respondsToSelector:@selector(toolView:switchState:)]) {
        [_delegate toolView:self switchState:sender.isOn];
    }
}

#pragma mark - UI布局
- (void)setupUI
{
    [self addSubview:self.tipLabel];
}

#pragma mark -
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIEdgeInsets inset = self.contentInset;
    CGFloat self_width = self.bounds.size.width;
    CGFloat self_height = self.bounds.size.height;
    
    CGFloat sepView_h = 0;
    if (self.hasSep) {
        sepView_h = self.sepHeight;
        self.sepView.frame = ({
            CGRect frame = self.sepView.frame;
            frame.origin.x = self.sepLeftMargin;
            frame.origin.y = self_height - sepView_h;
            frame.size.height = sepView_h;
            frame.size.width = self_width - self.sepLeftMargin - self.sepRightMargin;
            frame;
        });
    }
    
    CGFloat tipLabel_x = self.contentInset.left + self.tipLabelMargin;
    if (self.leftView) {
        
        CGRect leftViewFrame = self.leftView.frame;
        CGFloat yOffset = (self_height - leftViewFrame.size.height - sepView_h) / 2;
        self.leftView.frame = ({
            CGRect frame = self.leftView.frame;
            frame.origin.y = yOffset;
            frame.origin.x = inset.left;
            frame;
        });
        tipLabel_x += self.leftView.bounds.size.width;
    }
    
    [self.tipLabel sizeToFit];
    self.tipLabel.frame = ({
        CGRect frame = self.tipLabel.frame;
        frame.origin.y = (self_height - frame.size.height - sepView_h) / 2;
        frame.origin.x = tipLabel_x;
        frame;
    });
    
    CGFloat arrowView_x = self_width - inset.right;
    if (self.hasArrow) {
        CGSize size = CGSizeZero;
        if (self.arrowImage) {
            size = self.arrowImage.size;
        }else if (self.arrowTitle){
            size = CGSizeMake([self widthWithString:self.arrowTitle Font:self.arrowTitleFont constrainedToHeight:self.arrowTitleFont.lineHeight], self.arrowTitleFont.lineHeight);
        }
        arrowView_x -= size.width;
        self.button.frame = ({
            CGRect frame = self.button.frame;
            frame.origin.x = arrowView_x;
            frame.origin.y = (self_height - size.height - sepView_h) / 2;
            frame.size = size;
            frame;
        });
        
        CGFloat top_bottom = (self_height - self.button.frame.size.height - sepView_h) / 2;
        [self.button sd_setEnlargeEdgeWithTop:top_bottom right:inset.right bottom:top_bottom left:self.arrowMargin];
    }else{
        self.arrowMargin = 0;
    }
    
    
    CGFloat placeLabel_x = CGRectGetMaxX(self.tipLabel.frame) + self.placeMargin;
    if (self.textAlignment == NSTextAlignmentLeft) {
        placeLabel_x = self.placeMaxMargin;
    }
    
    if (self.viewType == SDToolViewTypeLabel) {
        [self.placeLabel sizeToFit];
        self.placeLabel.frame = ({
            CGRect frame = self.placeLabel.frame;
            frame.origin.x = placeLabel_x;
            frame.origin.y = (self_height - frame.size.height - sepView_h) / 2;
            frame.size.width = arrowView_x - placeLabel_x - self.arrowMargin;
            frame;
        });
    }else if (self.viewType == SDToolViewTypeTextField){
        self.textField.frame = ({
            CGRect frame = self.textField.frame;
            frame.origin.x = placeLabel_x;
            frame.origin.y = 0;
            frame.size = CGSizeMake(arrowView_x - placeLabel_x - self.arrowMargin, self_height - sepView_h);
            frame;
        });
    }else if (self.viewType == SDToolViewTypeSwitch){
        self.typeSwitch.frame = ({
            CGRect frame = self.typeSwitch.frame;
            frame.origin.x = arrowView_x - self.arrowMargin - frame.size.width ;
            frame.origin.y = (self_height - frame.size.height - sepView_h) / 2;
            frame;
        });
    }
}

#pragma mark - 属性设置
- (void)setViewType:(SDToolViewType)viewType
{
    _viewType = viewType;
    if (viewType == SDToolViewTypeLabel) {
        
        UILabel *placeLabel = [[UILabel alloc] init];
//        placeLabel.backgroundColor = RandomColor;
        placeLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagAction:)];
        [placeLabel addGestureRecognizer:tag];
        [self addSubview:placeLabel];
        self.placeLabel = placeLabel;
    }else if (viewType == SDToolViewTypeTextField){
        
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
        [textField addTarget:self action:@selector(textDidEndChange:) forControlEvents:UIControlEventEditingDidEnd];

        [textField setValue:self.placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
//        textField.backgroundColor = RandomColor;
        [self addSubview:textField];
        self.textField = textField;
    }else if (viewType == SDToolViewTypeSwitch){
        UISwitch *typeSwitch = [[UISwitch alloc] init];
        [typeSwitch addTarget:self action:@selector(typeSwitchAction:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:typeSwitch];
        self.typeSwitch = typeSwitch;
    }
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    _contentInset = contentInset;
    self.sepLeftMargin = contentInset.left;
    self.sepRightMargin = contentInset.right;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textAlignment = textAlignment;
    if (self.viewType == SDToolViewTypeLabel) {
        self.placeLabel.textAlignment = textAlignment;
    }else{
        self.textField.textAlignment = textAlignment;
    }
}

- (void)setHasArrow:(BOOL)hasArrow
{
    _hasArrow = hasArrow;
    
    if (self.button) {
        [self.button removeFromSuperview];
        _button = nil;
    }
    
    if (hasArrow) {
        UIButton *button = [[UIButton alloc] init];
        button.adjustsImageWhenHighlighted = NO;
//        [button setBackgroundColor:RandomColor];
        [button addTarget:self action:@selector(arrowAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.button = button;
    }
}

- (void)setHasSep:(BOOL)hasSep
{
    _hasSep = hasSep;
    
    if (self.sepView) {
        [self.sepView removeFromSuperview];
        _sepView = nil;
    }
    
    if (hasSep) {
        UIView *sepView = [[UIImageView alloc] init];
        [self addSubview:sepView];
        self.sepView = sepView;
    }
}

- (void)setSepColor:(UIColor *)sepColor
{
    _sepColor = sepColor;
    if (self.hasSep) {
        self.sepView.backgroundColor = sepColor;
    }
}

- (void)setArrowImage:(UIImage *)arrowImage
{
    _arrowImage = arrowImage;
    if (self.hasArrow) {
        [self.button setImage:arrowImage forState:UIControlStateNormal];
        [self.button setTitle:@"" forState:UIControlStateNormal];
    }
}

- (void)setArrowTitle:(NSString *)arrowTitle
{
    _arrowTitle = arrowTitle;
    if (self.hasArrow) {
        [self.button setImage:nil forState:UIControlStateNormal];
        [self.button setTitle:arrowTitle forState:UIControlStateNormal];
    }
}

- (void)setArrowTitleFont:(UIFont *)arrowTitleFont
{
    _arrowTitleFont = arrowTitleFont;
    if (self.hasArrow) {
        self.button.titleLabel.font = arrowTitleFont;
    }
}

- (void)setArrowTitleColor:(UIColor *)arrowTitleColor
{
    _arrowTitleColor = arrowTitleColor;
    if (self.hasArrow) {
        [self.button setTitleColor:arrowTitleColor forState:UIControlStateNormal];
    }
}


- (void)setLeftView:(UIView *)leftView
{
    if (self.leftView) {
        [self.leftView removeFromSuperview];
        _leftView = nil;
    }
    if (leftView) {
        [self addSubview:leftView];
        _leftView = leftView;
    }
}

- (void)setTipText:(NSString *)tipText
{
    _tipText = tipText;
    self.tipLabel.text = tipText;
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    self.currentText = text;
    
    if (self.viewType == SDToolViewTypeLabel) {

        if (text) {
            self.placeLabel.text = text;
            self.placeLabel.textColor = self.textColor;
        }

    }else{
        self.textField.text = text;
    }
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if (self.viewType == SDToolViewTypeLabel) {
        self.placeLabel.text = placeholder;
    }else if (self.viewType == SDToolViewTypeTextField){
        self.textField.placeholder = placeholder;
    }
}

- (void)setTipFont:(UIFont *)_tipFont
{
    _tipFont = _tipFont;
    
    self.tipLabel.font = _tipFont;
}

- (void)setTextFont:(UIFont *)textFont
{
    _textFont = textFont;
    if (self.viewType == SDToolViewTypeLabel) {
        self.placeLabel.font = textFont;
    }else if (self.viewType == SDToolViewTypeTextField){
        self.textField.font = textFont;
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    if (self.viewType == SDToolViewTypeLabel) {
        self.placeLabel.textColor = placeholderColor;
    }else if (self.viewType == SDToolViewTypeTextField){
        [self.textField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (void)setTipTextColor:(UIColor *)tipTextColor
{
    _tipTextColor = tipTextColor;
    self.tipLabel.textColor = tipTextColor;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    
    if (self.viewType == SDToolViewTypeTextField) {
        self.textField.textColor = textColor;
    }
}

- (void)setTypeNormalState:(BOOL)typeNormalState
{
    _typeNormalState = typeNormalState;
    self.typeSwitch.on = typeNormalState;
}



#pragma mark - 懒加载
- (UILabel *)tipLabel
{
    if (_tipLabel == nil) {
        _tipLabel = [[UILabel alloc] init];
//        _tipLabel.backgroundColor = RandomColor;
    }
    return _tipLabel;
}

#pragma mark - 私有方法
- (CGFloat)widthWithString:(NSString *)string Font:(UIFont *)font constrainedToHeight:(CGFloat)height
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |
                                               NSStringDrawingTruncatesLastVisibleLine)
                                   attributes:attributes
                                      context:nil].size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
#endif
    
    return ceil(textSize.width);
}

@end


