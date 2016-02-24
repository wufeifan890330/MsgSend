//
//  ViewController.m
//  ttt
//
//  Created by 吴非凡 on 16/2/24.
//  Copyright © 2016年 PCI. All rights reserved.
//

#import "ViewController.h"
#import "Test01.h"
#import "Test02.h"
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    objc_msgSend([Test01 new], @selector(test));
    //    [self performSelector:@selector(test)];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
