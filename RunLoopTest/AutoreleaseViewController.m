//
//  AutoreleaseViewController.m
//  RunLoopTest
//
//  Created by 程探赜 on 2018/10/11.
//  Copyright © 2018年 com.ofo. All rights reserved.
//

#import "AutoreleaseViewController.h"

/*
 
 1、关于嵌套runloop
    嵌套的runloop并不是有多个runloop，只是调用栈不同（开启了多个loop循环）或者说嵌套层。如果把runloop理解为一个函数，那么就可以理解为函数r1调用了自身。
 
    因为有一个全局dictory记录线程信息作为key，这个线程对应了唯一的runloop作为value
 
    比如在主线程中又调用了run，这时就是一个嵌套的runloop，他会取代之前的运行循环处理各种事件（有待考证）
 
2、关于autoreleasepool
 
    在进入kCFRunLoopBeforeWaiting的时候，释放并新建
        AutoreleasePool: _objc_autoreleasePoolPop();
        _objc_autoreleasePoolPush();
 */


@interface AutoreleaseViewController ()

@end


@implementation AutoreleaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad runloo: %@", [NSRunLoop currentRunLoop]);
    // Do any additional setup after loading the view.

    NSString * __autoreleasing string = [[NSString alloc]initWithString:@""];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear runloo: %@", [NSRunLoop currentRunLoop]);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear runloo: %@", [NSRunLoop currentRunLoop]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    
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
