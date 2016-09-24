//
//  ViewController.m
//  MBProgressHUD-LM
//
//  Created by 刘明 on 16/9/24.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+LM.h"

@interface ViewController ()

@property (nonatomic, assign) float progress;

@property (nonatomic, strong) NSTimer *time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)simpleMessageBtn:(id)sender {
    
    [MBProgressHUD LM_messageAutoHide:@"MBProgressHUD+LM 简单信息" View:self.view];
}

- (IBAction)JuhuaMeaageBtn:(id)sender {
    
    [MBProgressHUD LM_messageWithJuhua:@"MBProgressHUD+LM 带菊花信息" View:self.view];
}

- (IBAction)successMessageBtn:(id)sender {
    
    [MBProgressHUD LM_successMessage:@"MBProgressHUD+LM 成功信息" andView:self.view];
}
- (IBAction)failMessageBtn:(id)sender {
    
    [MBProgressHUD LM_failMessage:@"MBProgressHUD+LM 失败信息" andView:self.view];
}


- (IBAction)warningMessageBtn:(id)sender {
    
    [MBProgressHUD LM_warningMessage:@"MBProgressHUD+LM 警告信息" andView:self.view];
}

- (IBAction)infoMessageBtn:(id)sender {
    
    [MBProgressHUD LM_infoMessage:@"MBProgressHUD+LM 带图信息" andView:self.view];
}

- (IBAction)barProgressBtn:(id)sender {
    
    self.progress = 0;
    
    NSTimer *time = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSDefaultRunLoopMode];

    
    self.time = time;
    
}

- (void)timer{
    
    
    [MBProgressHUD LM_progressForDeterminateHorizontalBarWithMessage:[NSString stringWithFormat:@"%%%.2f",self.progress * 100] Progress:self.progress View:self.view];
    
    if (self.progress > 1.1) {
        
        [MBProgressHUD LM_hideHUDFromView:self.view];
        
        [self.time invalidate];
        
        self.time = nil;
        
    }
    
    self.progress += 0.1;

    
}

- (IBAction)determinateProgress:(id)sender {
    
    self.progress = 0;
    
    NSTimer *time = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(time2) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSDefaultRunLoopMode];
    
    self.time = time;
}


- (void)time2{
    
    [MBProgressHUD LM_progressForAnnularDeterminateWithMessage:[NSString stringWithFormat:@"%%%.2f",self.progress * 100] Progress:self.progress View:self.view];
    
    if (self.progress > 1.1) {
        
        [self.time invalidate];
        
        self.time = nil;
        
        [MBProgressHUD LM_hideHUDFromView:self.view];

    }
    
    self.progress += 0.1;
    
}
- (IBAction)navigationRightItem:(id)sender {
    
    [MBProgressHUD LM_hideHUDFromView:self.view];
}
@end
