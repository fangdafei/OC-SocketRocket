//
//  ViewController.m
//  TestWebSocket
//
//  Created by xrs_fang on 2018/6/14.
//  Copyright © 2018年 xrs_fang. All rights reserved.
//

#import "ViewController.h"
#import "SocketModel.h"

@interface ViewController ()
{
    UITextField * textField;
    
    SocketModel *socketModel;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    socketModel=[SocketModel share];
    
    textField=[[UITextField alloc]initWithFrame:CGRectMake(50, 100, 100,40)];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.layer.masksToBounds=YES;
    textField.layer.cornerRadius=12;
    [self.view addSubview:textField];
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(50, 150, 100, 40)];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(sendMsg) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button1=[[UIButton alloc]initWithFrame:CGRectMake(50, 200, 100, 40)];
    [button1 setTitle:@"连接"forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 10;
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(startSocket) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button2=[[UIButton alloc]initWithFrame:CGRectMake(50, 250, 100, 40)];
    [button2 setTitle:@"断开" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 10;
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(stopSocket) forControlEvents:UIControlEventTouchUpInside];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"webSocketDic" object:nil];
    
}


-(void)sendMsg
{
    if (textField.text.length==0) {
        return;
    }
    NSLog(@"发送消息");
    [socketModel sendMsg:textField.text];
}
-(void)startSocket
{
    NSLog(@"连接");
    [socketModel connect];
}
-(void)stopSocket
{
    NSLog(@"断开连接");
    [socketModel disConnect];
}

- (void)notification:(NSNotification *)notification{
    
    NSLog(@"-接收到消息通知-:%@",notification.userInfo);
    
}




- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"webSocketDic" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
