//
//  VDropDownMenu.m
//  VDropDownMenu
//
//  Created by Vols on 15/3/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VDropDownMenu.h"

@interface VDropDownMenu ()

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIButton *btnSender;

@property (nonatomic, assign) float selfHeight;
@property (nonatomic, assign) float selfWidth;


//@property(nonatomic, strong) NSArray *dataSource;

@end

@implementation VDropDownMenu

- (instancetype)initDropDown:(UIButton *)b :(NSArray *)array{
    _btnSender = b;

    self = [super init];
    if (self) {
        CGRect btnFrame = b.frame;
        self.frame = CGRectMake(btnFrame.origin.x, btnFrame.origin.y+btnFrame.size.height, btnFrame.size.width, 0);
        self.dataSource = [NSArray arrayWithArray:array];
//        self.layer.masksToBounds = NO;
//        self.layer.cornerRadius = 8;
//        self.layer.shadowOffset = CGSizeMake(-5, 5);
//        self.layer.shadowRadius = 5;
//        self.layer.shadowOpacity = 0.5;
        
        self.selfHeight = 40*array.count;
        self.selfWidth = btnFrame.size.width;

        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btnFrame.size.width, 0)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 5;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.separatorColor = [UIColor grayColor];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        self.frame = CGRectMake(btnFrame.origin.x, btnFrame.origin.y+btnFrame.size.height, btnFrame.size.width, _selfHeight);
        _tableView.frame = CGRectMake(0, 0, btnFrame.size.width, _selfHeight);
        [UIView commitAnimations];
        
        [b.superview addSubview:self];
        [self addSubview:self.tableView];
    }
    
    return self;
}

-(void)hideDropDown{
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _selfWidth, 0);
                         _tableView.frame = CGRectMake(0, 0, _selfWidth, 0);
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    UIButton * cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cityBtn.frame = CGRectMake(0, 2, 75, 35);
    [cityBtn setBackgroundImage:[UIImage imageNamed:@"locationbg"] forState:UIControlStateNormal];
    [cityBtn setBackgroundImage:[UIImage imageNamed:@"dropdown"] forState:UIControlStateSelected];
    [cityBtn setTitle:self.dataSource[indexPath.row] forState:UIControlStateNormal];
    cityBtn.tag = indexPath.row + 1000;
    [cityBtn addTarget:self action:@selector(cityAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.contentView addSubview:cityBtn];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self hideDropDown];
////    UITableViewCell *c = [tableView cellForRowAtIndexPath:indexPath];
//    
//    NSLog(@"%@", self.dataSource[indexPath.row]);
//    [self.btnSender setTitle:self.dataSource[indexPath.row] forState:UIControlStateNormal];
//    [self.delegate dropDownMenu:self selectedMenu:indexPath.row];
//}

- (void)cityAction:(UIButton *)button{
    [self hideDropDown];
    
    [self.btnSender setTitle:self.dataSource[button.tag - 1000] forState:UIControlStateNormal];
    [self.delegate dropDownMenu:self selectedMenu:button.tag - 1000];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
