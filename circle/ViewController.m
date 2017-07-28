//
//  ViewController.m
//  circle
//
//  Created by godlike on 17/7/28.
//  Copyright © 2017年 godlike. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CircleLayer *cLayer = [CircleLayer layer];
    
    
    [self.view.layer addSublayer:cLayer];
    [cLayer setFrame:CGRectMake(20, 20, 80, 80)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
