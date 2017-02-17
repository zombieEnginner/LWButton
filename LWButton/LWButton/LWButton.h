//
//  LWButton.h
//  LWProjectFramework
//
//  Created by bhczmacmini on 17/1/11.
//  Copyright © 2017年 LW. All rights reserved.
//

#define lw_label_img_t_b_margin 4 //文字和图片上下间距
#define lw_label_img_r_l_margin 0 //文字和图片左右间距

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger ,LWAlignmentStyle){
    LWAlignmentStyleTop = 1,// 图标在上，文本在下
    LWAlignmentStyleBottom = 2, // 图标在下，文本在上
    LWAlignmentStyleLeft = 3, // 图标在左边，文本在右边
    LWAlignmentStyleRight = 4, // 图标在右边，文本在左边
    LWAlignmentStyleText = 5, // 只有文本
    LWAlignmentStyleImage = 6 // 只有图片
};

@interface LWButton : UIButton

//图片文字位置类型
@property (nonatomic,assign)LWAlignmentStyle style;

//使用倒计时
@property (nonatomic,strong)NSString *startCountdownStr;//开始前倒计时文字
@property (nonatomic,strong)NSString *countdownIngStr;//倒计时中的文字  默认 重新获取
@property (nonatomic,assign)int countdownTime;//倒计时时间 默认60s

//初始化
- (instancetype)initWithAlignmentStyle:(LWAlignmentStyle)style withFrame:(CGRect)frame;

//显示小红点
- (void)showBadge;

//隐藏小红点
- (void)hideBadge;

//验证倒计时
- (void)countdownStart;

@end
