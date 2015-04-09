//
//  VDropDownMenu.h
//  VDropDownMenu
//
//  Created by Vols on 15/3/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VDropDownMenu;
@protocol VDropDownMenuDelegate

- (void) dropDownMenu:(VDropDownMenu*)dropDownMenu selectedMenu:(NSUInteger)index;

@end

@interface VDropDownMenu : UIView <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *dataSource;
@property (nonatomic, assign) id <VDropDownMenuDelegate> delegate;

-(void)hideDropDown;
- (instancetype)initDropDown:(UIButton *)b  :(NSArray *)array;

@end
