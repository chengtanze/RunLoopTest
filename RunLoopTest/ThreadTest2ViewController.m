//
//  ThreadTest2ViewController.m
//  RunLoopTest
//
//  Created by 程探赜 on 2018/10/10.
//  Copyright © 2018年 com.ofo. All rights reserved.
//

/*
 NSRunLoop总结：
 1、多线程中启动runloop
 多线程中如果没有一个输入源或者timer则立刻返回
 
 - (void)run;
如果加入了输入源或是timer就进入无限循环，虽然不会阻塞当前线程,在此期间会处理来自输入源的数据
 
 
*/

#import "ThreadTest2ViewController.h"

@interface ThreadTest2ViewController ()
@property(nonatomic, strong)NSThread *thread;
@end

@implementation ThreadTest2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createThread:(id)sender {
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadTest) object:nil];
    [_thread start];
}

- (IBAction)sendMsg:(id)sender {
    
}

- (IBAction)stop:(id)sender {
}

-(void)threadTest{
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    
    // Create and schedule the timer.
    NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:3 target:self
                                                   selector:@selector(doFireTimer) userInfo:nil repeats:YES];
    
    
    
    //[timer fire]; //需要立即执行
    
    
    NSLog(@"threadTest1");
    //[[NSRunLoop currentRunLoop] run];  // 调用子线程runLoop
    
    //[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];  // 调用子线程runLoop
    
    
    NSLog(@"threadTest2");
}

-(void)doFireTimer{
    NSLog(@"doFireTimer");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
