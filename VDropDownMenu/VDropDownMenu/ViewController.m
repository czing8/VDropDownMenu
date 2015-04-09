//
//  ViewController.m
//  VDropDownMenu
//
//  Created by Vols on 15/3/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "ViewController.h"

#import "VDropDownMenu.h"

@interface ViewController () <VDropDownMenuDelegate>

@property (nonatomic, strong) VDropDownMenu * dropMenu;
@property (nonatomic, assign) BOOL showDropMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 70, 35);

    [btn setBackgroundImage:[UIImage imageNamed:@"dropdown"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"locationbg"] forState:UIControlStateSelected];
    [btn setTitle:@"北京" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (IBAction)click:(id)sender {
    
    if (_dropMenu == nil) {
        _dropMenu = [[VDropDownMenu alloc]initDropDown:sender :@[@"北京", @"上海"]];
        _dropMenu.delegate = self;
    }
    else{
        [_dropMenu hideDropDown];
        _dropMenu = nil;
    }
}

- (void)dropDownMenu:(VDropDownMenu *)dropDownMenu selectedMenu:(NSUInteger)index{
    _dropMenu = nil;
    
}

//- (void)setShowDropMenu:(BOOL)showDropMenu{
//    _showDropMenu = showDropMenu;
//    
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
