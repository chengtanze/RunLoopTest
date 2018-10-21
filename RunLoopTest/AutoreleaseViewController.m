//
//  AutoreleaseViewController.m
//  RunLoopTest
//
//  Created by 程探赜 on 2018/10/11.
//  Copyright © 2018年 com.ofo. All rights reserved.
//

#import "AutoreleaseViewController.h"

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
