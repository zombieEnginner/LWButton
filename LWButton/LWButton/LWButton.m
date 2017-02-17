//
//  LWButton.m
//  LWProjectFramework
//
//  Created by bhczmacmini on 17/1/11.
//  Copyright © 2017年 LW. All rights reserved.
//

#import "LWButton.h"
#import "Masonry.h"

@implementation LWButton

- (instancetype)initWithAlignmentStyle:(LWAlignmentStyle)style withFrame:(CGRect)frame
{
    if (self == [super init]) {
        self.style = style;
        self.frame = frame;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.style == LWAlignmentStyleBottom) {
        [self alignmentBottom];
    }else if(self.style == LWAlignmentStyleTop){
        [self alignmentTop];
    } else if (self.style == LWAlignmentStyleLeft){
        
    } else if (self.style == LWAlignmentStyleRight){
        [self alignmentRight];
    }
}

//图片在底部
- (void)alignmentBottom{
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGFloat btnW = self.frame.size.width;
    CGFloat btnH = self.frame.size.height;
    
    CGFloat titleLabelH = frame.size.height;
    CGFloat imageViewH = btnH - titleLabelH - lw_label_img_t_b_margin * 3;
    CGFloat margin = (btnW - imageViewH) / 2;
    
    self.titleLabel.frame = CGRectMake(0 , lw_label_img_t_b_margin, btnW, btnH - imageViewH - lw_label_img_t_b_margin * 3);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(margin, self.titleLabel.frame.size.height + lw_label_img_t_b_margin * 2, imageViewH, imageViewH);
}

//图片在上部
- (void)alignmentTop{
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGFloat btnW = self.frame.size.width;
    CGFloat btnH = self.frame.size.height;
    
    CGFloat titleLabelH = frame.size.height;
    CGFloat imageViewH = btnH - titleLabelH - lw_label_img_t_b_margin * 3;
    CGFloat margin = (btnW - imageViewH) / 2;
    
    self.imageView.frame = CGRectMake(margin, lw_label_img_t_b_margin, imageViewH, imageViewH);
    self.titleLabel.frame = CGRectMake(0 , imageViewH + lw_label_img_t_b_margin * 2,btnW, btnH - imageViewH - lw_label_img_t_b_margin * 3);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

//图片在右边
- (void)alignmentRight{
    
    CGFloat btnW = self.frame.size.width;
    CGFloat btnH = self.frame.size.height;
    CGFloat imageViewH = self.imageView.frame.size.height;
    CGFloat titleLabelH = self.titleLabel.frame.size.height;
    CGFloat margin = lw_label_img_r_l_margin;
    
    self.imageView.frame = CGRectMake(margin+btnW/2, (btnH-imageViewH)/2, imageViewH, imageViewH);
    self.titleLabel.frame = CGRectMake(0 , (btnH-titleLabelH)/2,btnW/2-margin, titleLabelH);
    self.titleLabel.textAlignment = NSTextAlignmentRight;
}

#pragma mark - 显示红点
//显示小红点
- (void)showBadge{
    //移除之前的小红点
    [self removeBadge];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.userInteractionEnabled = YES;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.tag = 999;
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
//    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
//    CGFloat x = ceilf(tabFrame.size.width-15);
//    CGFloat y = ceilf(0.1 * tabFrame.size.height);
//    badgeView.frame = CGRectMake(x, y, 8, 8);//圆形大小为10
    [self addSubview:badgeView];
    
    if (self.style == LWAlignmentStyleBottom) {// 图标在下，文本在上
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imageView.mas_right).offset(5);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.imageView.mas_top).offset(0);
        }];
    }else if(self.style == LWAlignmentStyleTop){// 图标在上，文本在下
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imageView.mas_right).offset(5);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.imageView.mas_top).offset(0);
        }];
    } else if (self.style == LWAlignmentStyleLeft){// 图标在左边，文本在右边
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imageView.mas_right).offset(5);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.imageView.mas_top).offset(0);
        }];
    } else if (self.style == LWAlignmentStyleRight){// 图标在右边，文本在左边
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imageView.mas_right).offset(5);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.imageView.mas_top).offset(0);
        }];
    } else if (self.style == LWAlignmentStyleText){//只有文字
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel.mas_right).offset(15);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.titleLabel.mas_top).offset(-5);
        }];
    } else if (self.style == LWAlignmentStyleImage){//只有图片
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imageView.mas_right).offset(5);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.imageView.mas_top).offset(0);
        }];
    } else {
       //默认
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(0);
            make.width.and.height.equalTo(@10);
            make.top.equalTo(self.mas_top).offset(0);
        }];
    }
}

//隐藏小红点
- (void)hideBadge{
    //移除小红点
    [self removeBadge];
}

//移除小红点
- (void)removeBadge{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 999) {
            [subView removeFromSuperview];
        }
    }
}

//验证倒计时
- (void)countdownStart
{
    __block int timeout; //倒计时
    if (self.countdownTime) {
        timeout = self.countdownTime;
    } else {
        timeout = 60;
    }
    
    NSString *countdownIngStr;
    NSString *startCountdownStr;
    if (self.countdownIngStr) {
        countdownIngStr = self.countdownIngStr;
    } else {
        countdownIngStr = @"重新获取";
    }
    
    if (self.startCountdownStr) {
        startCountdownStr = self.startCountdownStr;
    } else {
        startCountdownStr = self.titleLabel.text;
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //                        [sender setBackgroundImage:[UIImage imageNamed:@"btn-yanzhengma"] forState:UIControlStateNormal];
                [self setTitle:startCountdownStr forState:UIControlStateNormal];
                self.enabled = YES;
            });
        } else {
            int seconds = timeout;//int seconds = timeout % 31
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //                        [sender setBackgroundImage:[UIImage imageNamed:@"btn-huoquyanzhengma-n"] forState:UIControlStateNormal];
                [self setTitle:[NSString stringWithFormat:@"%@(%@s)",countdownIngStr,strTime] forState:UIControlStateNormal];
                self.enabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(timer);
}

@end
