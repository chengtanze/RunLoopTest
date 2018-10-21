//
//  ThreadTest1ViewController.m
//  RunLoopTest
//
//  Created by 程探赜 on 2018/10/9.
//  Copyright © 2018年 com.ofo. All rights reserved.
//

#import "ThreadTest1ViewController.h"

@interface ThreadTest1ViewController ()
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) BOOL isCanceled;
@end



/*
 NSRunLoop总结：
 1、主线程中启动runloop
 
 - (void)run;
 主线程中如果没有一个输入源或者timer则立刻返回，但是主线程中会有其他输入源或timer所以不会退出（进入无限循环，虽然不会阻塞主线程）
 在此期间会处理来自输入源的数据（如：在主线程调用时会触发）
 
 
 - (void)runUntilDate:(NSDate *)limitDate；
 A、如果我们设置了超时时间，那么 runloop 会在处理完事件或超时后结束，此时我们可以选择重新开启 runloop
 B、如果设置为[NSDate distantFuture] 就和run的效果一样
 
      示例代码：
     //等同于 run, 可保证一直运行
     [runLoop runUntilDate:[NSDate distantFuture]];
 
     //立即返回, 退出 RunLoop
     [runLoop runUntilDate:[NSDate date]];
 
     //然后过12秒后返回
     [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:12.0f]];
 
 
 - (BOOL)runMode:(NSString )mode beforeDate:(NSDate )limitDate
 该方法开启的 RunLoop 处理完之后会立即返回(once), 如果在指定日期内事件还没处理, 在该日期后会立即返回.
 
     示例代码：
     //立即返回
     [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
 
     //有事件到达处理后就返回，如果没有则过12秒返回
     [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:12.0]];
 
 
 
 
 
 总结：
 
 查看苹果文档得知，前两种启动方式会重复调用runMode:beforeDate:方法
 
 [[NSRunLoop mainRunLoop] run]; //主线程永远等待，但让出主线程时间片
 
 [[NSRunLoop mainRunLoop] runUntilDate:[NSDate distantFuture]]; //等同上面调用
 
 [[NSRunLoop mainRunLoop] runUntilDate:[NSDate date]]; //立即返回
 
 [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10.0]]; //主线程等待，但让出主线程时间片，然后过10秒后返回
 
 [[NSRunLoop mainRunLoop] runMode:NSDefaultRunLoopMode beforeDate: [NSDate distantFuture]]; //主线程等待，但让出主线程时间片；有事件到达就返回，比如点击UI等。
 
 [[NSRunLoop mainRunLoop] runMode:NSDefaultRunLoopMode beforeDate: [NSDate date]]; //立即返回
 
 [[NSRunLoop mainRunLoop] runMode:NSDefaultRunLoopMode beforeDate: [NSDate dateWithTimeIntervalSinceNow:10.0]]; //主线程等待，但让出主线程时间片；有事件到达就返回，如果没有则过10秒返回。
 */
@implementation ThreadTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}
- (IBAction)sendMsg:(id)sender {
    [self performSelector:@selector(doOtherTask)];
}

- (IBAction)button:(id)sender {
    NSLog(@"starting threading ");
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(doTimerTask) userInfo:nil repeats:YES];
    //[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    while (!self.isCanceled)
    {
        [self doOtherTask];
        
        //- (void)run;
        //进入处理事件循环，如果没有事件则立刻返回。注意：主线程上调用这个方法会导致无法返回（进入无限循环，虽然不会阻塞主线程），
        //因为主线程一般总是会有事件处理。
        
        
//        [[NSRunLoop currentRunLoop] run];
//        NSLog(@"after runloop.........");
        
//         [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
//        NSLog(@"after runloop.........");
        
       BOOL ret = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"after runloop counting.........: %d", ret);
        if (!ret)
        {
            _isCanceled = YES;
        }
    }
    NSLog(@"finishing thread.........");
}


- (void)doTimerTask
{
    NSLog(@"do timer task  , %@", [NSThread currentThread]);
}

- (void)doOtherTask
{
    NSLog(@"do other task");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
