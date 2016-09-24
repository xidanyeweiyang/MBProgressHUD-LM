//
//  MBProgressHUD+LM.h
//  MBProgress的学习
//
//  Created by 刘明 on 16/9/24.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LM)

/**
 *  LM_工厂方法
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 *  @param mode      hud的样式
 *  @param imageName 图片
 *  @param progress  进度
 *  @param time      延迟消失时间
 */
+ (void)LM_factoryWithMessage:(NSString *)message View:(UIView *)view Mode:(MBProgressHUDMode)mode ImageName:(NSString *)imageName Progress:(CGFloat)progress RemainTime:(CGFloat)time;

/**
 *  LM_自定义显示图片
 *
 *  @param message      文本
 *  @param view      父视图 nil ==> keyWindow
 *  @param imageName 图片
 *  @param time      延迟消失时间
 */
+ (void)LM_customDefinedWithMessage:(NSString *)message View:(UIView *)view ImageName:(NSString *)imageName RemainTime:(CGFloat)time;

/**
 *  LM_成功信息展示
 *
 *  @param message 成功信息
 */
+ (void)LM_successMessage:(NSString *)message andView:(UIView *)view;

/**
 *  LM_失败信息展示
 *
 *  @param message 失败信息
 */
+ (void)LM_failMessage:(NSString *)message andView:(UIView *)view;

/**
 *  LM_警告信息展示
 *
 *  @param message 警告信息
 */
+ (void)LM_warningMessage:(NSString *)message andView:(UIView *)view;

/**
 *  LM_信息展示
 *
 *  @param message 信息
 */
+ (void)LM_infoMessage:(NSString *)message andView:(UIView *)view;

/**
 *  LM_文本工厂方法
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 *  @param mode      hud的样式
 *  @param time      延迟消失时间
 */
+ (void)LM_factoryMessage:(NSString *)message View:(UIView *)view Mode:(MBProgressHUDMode)mode RemainTime:(CGFloat)time;

/**
 *  LM_带菊花,不会自动消失
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 */
+ (void)LM_messageWithJuhua:(NSString *)message View:(UIView *)view;

/**
 *  LM_不带菊花,自动消失 (通常简单展示信息)
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 */
+ (void)LM_messageAutoHide:(NSString *)message View:(UIView *)view;

/**
 *  LM_进度工厂方法
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 *  @param mode      hud的样式
 *  @param time      延迟消失时间
 */
+ (void)LM_factoryForProgressWithMessage:(NSString *)messgae View:(UIView *)view Mode:(MBProgressHUDMode)mode Progress:(CGFloat)progress  RemainTime:(CGFloat)time;

/**
 *  LM_圆弧样式进度信息
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 */
+ (void)LM_progressForAnnularDeterminateWithMessage:(NSString *)messgae Progress:(CGFloat)progress View:(UIView *)view;

/**
 *  LM_圆饼样式进度信息
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 */
+ (void)LM_progressForDeterminateWithMessage:(NSString *)messgae Progress:(CGFloat)progress View:(UIView *)view;


/**
 *  LM_进度条样式进度信息
 *
 *  @param message   文本
 *  @param view      父视图 nil ==> keyWindow
 */
+ (void)LM_progressForDeterminateHorizontalBarWithMessage:(NSString *)messgae Progress:(CGFloat)progress View:(UIView *)view;


/**
 *  隐藏消失HUD
 *
 *  @param view 从父视图
 */
+ (void)LM_hideHUDFromView:(UIView *)view;

/**
 *  快速从widow上隐藏消失HUD
 */
+ (void)LM_hideHUD;


@end
