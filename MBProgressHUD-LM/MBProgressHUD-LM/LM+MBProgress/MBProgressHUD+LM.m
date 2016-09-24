//
//  MBProgressHUD+LM.m
//  MBProgress的学习
//
//  Created by 刘明 on 16/9/24.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "MBProgressHUD+LM.h"

#define LMminShowTime               0.5 //最短展现时间
#define LMTextFont                  [UIFont systemFontOfSize:14]
#define LMbezelViewCornerRadius     10 //bezelView的圆角
#define LMcontentColor              [UIColor whiteColor] //内容颜色
#define LMAnimationType             MBProgressHUDAnimationZoom //出现消失的动画效果
#define LMBackgroundViewStyle       MBProgressHUDBackgroundStyleSolidColor //背景样式
#define LMbezelViewColor            [UIColor colorWithRed:28/255.0f green:28/255.0f blue:28/255.0f alpha:1]  //bezelView背景色


#define LMSuccessImageName          @"lm_hud_success"
#define LMWarningImageName          @"lm_hud_warning"
#define LMFailureImageName          @"lm_hud_error"
#define LMInfoingImageName          @"lm_hud_info"

#define LMSuccessRemainTime         2.0f
#define LMWarningRemainTime         2.0f
#define LMFailureRemainTime         3.0f
#define LMInfoingRemainTime         3.0f

#define LMAutoHideMessageTime       2.0f
#define LMJuhuaMessageTime          MAXFLOAT
#define LMProgressTime              MAXFLOAT



@implementation MBProgressHUD (LM)

#pragma mark- 文本工厂方法

+ (void)LM_factoryMessage:(NSString *)message View:(UIView *)view Mode:(MBProgressHUDMode)mode RemainTime:(CGFloat)time{
    
    [self LM_factoryWithMessage:message View:view Mode:mode ImageName:@"" Progress:0 RemainTime:time];
}

+ (void)LM_messageWithJuhua:(NSString *)message View:(UIView *)view{
    
    [self LM_factoryMessage:message View:view Mode:MBProgressHUDModeIndeterminate RemainTime:LMJuhuaMessageTime];
}

+ (void)LM_messageAutoHide:(NSString *)message View:(UIView *)view{

    [self LM_factoryMessage:message View:view Mode:MBProgressHUDModeText RemainTime:LMAutoHideMessageTime];
}

#pragma mark- 自定义图片方法

+ (void)LM_customDefinedWithMessage:(NSString *)message View:(UIView *)view ImageName:(NSString *)imageName RemainTime:(CGFloat)time{
    
    [self LM_factoryWithMessage:message View:view Mode:MBProgressHUDModeCustomView ImageName:imageName Progress:0 RemainTime:time];
}


+ (void)LM_warningMessage:(NSString *)message andView:(UIView *)view{
    
    [self LM_customDefinedWithMessage:message View:view ImageName:LMWarningImageName RemainTime:LMWarningRemainTime];
}


+ (void)LM_successMessage:(NSString *)message andView:(UIView *)view{
    
    [self LM_customDefinedWithMessage:message View:view ImageName:LMSuccessImageName RemainTime:LMSuccessRemainTime];
}


+ (void)LM_failMessage:(NSString *)message andView:(UIView *)view{
    
    
     [self LM_customDefinedWithMessage:message View:view ImageName:LMFailureImageName RemainTime:LMFailureRemainTime];
}


+ (void)LM_infoMessage:(NSString *)message andView:(UIView *)view{

     [self LM_customDefinedWithMessage:message View:view ImageName:LMWarningImageName RemainTime:LMWarningRemainTime];
}


#pragma mark- progress工厂方法


+ (void)LM_factoryForProgressWithMessage:(NSString *)messgae View:(UIView *)view Mode:(MBProgressHUDMode)mode Progress:(CGFloat)progress  RemainTime:(CGFloat)time{
    
    [self LM_factoryWithMessage:messgae View:view Mode:mode ImageName:@"" Progress:progress RemainTime:time];
}

+ (void)LM_progressForAnnularDeterminateWithMessage:(NSString *)messgae Progress:(CGFloat)progress View:(UIView *)view{
    
    [self LM_factoryForProgressWithMessage:messgae View:view Mode:MBProgressHUDModeAnnularDeterminate Progress:progress RemainTime:LMProgressTime];
    
}

+ (void)LM_progressForDeterminateWithMessage:(NSString *)messgae Progress:(CGFloat)progress View:(UIView *)view{
    
    [self LM_factoryForProgressWithMessage:messgae View:view Mode:MBProgressHUDModeDeterminate Progress:progress RemainTime:LMProgressTime];
}


+ (void)LM_progressForDeterminateHorizontalBarWithMessage:(NSString *)messgae Progress:(CGFloat)progress View:(UIView *)view{
    
    [self LM_factoryForProgressWithMessage:messgae View:view Mode:MBProgressHUDModeDeterminateHorizontalBar Progress:progress RemainTime:LMProgressTime];
}



#pragma mark- 工厂方法

+ (void)LM_factoryWithMessage:(NSString *)message View:(UIView *)view Mode:(MBProgressHUDMode)mode ImageName:(NSString *)imageName Progress:(CGFloat)progress RemainTime:(CGFloat)time{
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.removeFromSuperViewOnHide = YES;
    
    hud.minShowTime = LMminShowTime;
    
    hud.animationType = LMAnimationType;
    
    hud.bezelView.color = LMbezelViewColor;
    
    hud.bezelView.layer.cornerRadius = LMbezelViewCornerRadius;
    
    hud.backgroundView.style = LMBackgroundViewStyle;
    
    hud.mode = mode;
    
    if ((!message || [message isEqualToString:@""]) && mode == MBProgressHUDModeText) {
        
        message = @"此处方法有误:无图无文字 == 无真相";
    }
    
    hud.label.text = message;
    
    hud.label.font = LMTextFont;
    
    hud.label.numberOfLines = 0;
    
    hud.contentColor = LMcontentColor;
    
    hud.progress = progress;
    
    if (imageName && ![imageName isEqualToString:@""] && mode == MBProgressHUDModeCustomView) {
        
          hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    }
    
    if (time != LMJuhuaMessageTime  && time != LMProgressTime) {
     
        [hud hideAnimated:YES afterDelay:time];
        
    }    
    
}


+ (void)LM_hideHUDFromView:(UIView *)view{
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    
    [self hideHUDForView:view animated:YES];
}


+ (void)LM_hideHUD{
    
    [self LM_hideHUDFromView:nil];
}



@end
