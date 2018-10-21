//
//  ThreadTest3ViewController.m
//  RunLoopTest
//
//  Created by 程探赜 on 2018/10/10.
//  Copyright © 2018年 com.ofo. All rights reserved.
//

#import "ThreadTest3ViewController.h"

@interface ThreadTest3ViewController ()

@end

@implementation ThreadTest3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    while (1) {
        NSLog(@"run 1");
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"run 2");
    }
}

- (IBAction)click2:(id)sender {
    NSLog(@"click test");
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
