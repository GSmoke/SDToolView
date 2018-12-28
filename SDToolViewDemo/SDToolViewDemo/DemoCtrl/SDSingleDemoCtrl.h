//
//  SDSingleDemoCtrl.h
//  SDToolView
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, CtrlType) {
    CtrlTypeAll,
    CtrlTypeLabel00,
    CtrlTypeLabel05,
    CtrlTypeLabel10,
    CtrlTypeLabel20,
    CtrlTypeLabel25,
    CtrlTypeLabel30,
    CtrlTypeLabel35,
    CtrlTypeLabel40,
    CtrlTypeLabel45,
    CtrlTypeLabel50,
};
@interface SDSingleDemoCtrl : UIViewController
- (instancetype)initWithCtrlType:(CtrlType)ctrlType;
@end
