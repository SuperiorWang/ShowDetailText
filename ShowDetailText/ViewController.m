//
//  ViewController.m
//  ShowDetailText
//
//  Created by Wangchaoqun on 16/4/6.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "ViewController.h"
#import "ShowDetailView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton setTitle:@"Test" forState:UIControlStateNormal];
    testButton.bounds = CGRectMake(0, 0, 100, 30);
    testButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2., 50);
    testButton.backgroundColor = [UIColor redColor];
    [testButton addTarget:self action:@selector(showDetailView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
//    NSString* titelText = @"标题";
//    NSString* contentText = @"内容什么的我才不在乎，你告诉我怎么弄就好了！我要很多很多字，很多很多！哈哈哈哈哈哈！咦我怎么想到了很多很多水！哟哟切克闹，煎饼果子来一套！！！单位发放的萨芬我分为分为分威锋网去发送发任务分无法的是否任务发但是发二vd但是分我v发任务发v问吃大蒜分我吃v二发撒的任务发撒的热无法额发撒的分为发但是苦咖啡无法任务发额发而无法 无法任务吃无法任务发我发饿死安抚额如果热果然挺好他就还要提交 u控件库 就哭晕核桃仁和太热 核桃仁好他然后已经 预计有他核桃仁额太热俄台个人 和个人头好他好太热好已经 同意就要就u看i看u人让他个热好他好人 俄台个人个热太热后台然后有他就要他吧发给的是 个 问额如果额个热果然个人额个个人";
//    
//    ShowDetailView *view = [[ShowDetailView instance]initWithTitle:titelText AndContentText:contentText];
    
//    view.bounds = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) * 0.8, CGRectGetHeight([UIScreen mainScreen].bounds) * 0.6);
//    view.center = self.view.center;
//    [self.view addSubview:view];
}

- (void)showDetailView:(UIButton*)sender
{
    NSString* titelText = @"标题";
    NSString* contentText = @"内容什么的我才不在乎，你告诉我怎么弄就好了！我要很多很多字，很多很多！哈哈哈哈哈哈！咦我怎么想到了很多很多水！哟哟切克闹，煎饼果子来一套！！！单位发放的萨芬我分为分为分威锋网去发送发任务分无法的是否任务发但是发二vd但是分我v发任务发v问吃大蒜分我吃v二发撒的任务发撒的热无法额发撒的分为发但是苦咖啡无法任务发额发而无法 无法任务吃无法任务发我发饿死安抚额如果热果然挺好他就还要提交 u控件库 就哭晕核桃仁和太热 核桃仁好他然后已经 预计有他核桃仁额太热俄台个人 和个人头好他好太热好已经 同意就要就u看i看u人让他个热好他好人 俄台个人个热太热后台然后有他就要他吧发给的是 个 问额如果额个热果然个人额个个人";
    
    ShowDetailView *view = [[ShowDetailView instance]initWithTitle:titelText AndContentText:contentText];
//    [self.view addSubview:view];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
