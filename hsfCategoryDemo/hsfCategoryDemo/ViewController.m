//
//  ViewController.m
//  hsfCategoryDemo
//
//  Created by monkey2016 on 17/2/23.
//  Copyright © 2017年 monkey2016. All rights reserved.
//

#import "ViewController.h"

#import "AnimationCellVC.h"//cell的进入方式
#import "BtnLayoutVC.h"//button的图片文字布局方式
#import "EnlargeClickRectVC.h"//扩大点击范围
#import "CategoryOfUIViewVC.h"
#import "ScreenShotVC.h"//截屏
#import "ShakeVC.h"//抖动
#import "DCAnimationKitVC.h"//UIView 动画集合

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *source;
@end

@implementation ViewController
#pragma mark -懒加载
-(NSArray *)source{
    if (!_source) {
        _source = @[@"UITableViewCell+CellAnimation", @"UIButton+Layout", @"UIButton+enlargeClickRect", @"CategoryOfUIViewVC", @"UIView+screenshot", @"UIView+Shaking", @"UIView+DCAnimationKit"];
    }
    return _source;
}
#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"主页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //配置tableView
    [self setUpTableView];
    
}
//配置tableView
-(void)setUpTableView{
    //数据源代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //cell高度
    self.tableView.rowHeight = 60;
}
#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.source.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.source[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AnimationCellVC *animationCell_VC = [[AnimationCellVC alloc]init];
        [self.navigationController pushViewController:animationCell_VC animated:YES];
    }else if (indexPath.row == 1) {
        BtnLayoutVC *btnLayout_VC = [[BtnLayoutVC alloc]init];
        [self.navigationController pushViewController:btnLayout_VC animated:YES];
    }else if (indexPath.row == 2) {
        EnlargeClickRectVC *enlargeClickRect_VC = [[EnlargeClickRectVC alloc]init];
        [self.navigationController pushViewController:enlargeClickRect_VC animated:YES];
    }else if (indexPath.row == 3) {
        CategoryOfUIViewVC *categoryOfUIView_VC = [[CategoryOfUIViewVC alloc]init];
        [self.navigationController pushViewController:categoryOfUIView_VC animated:YES];
    }else if (indexPath.row == 4) {
        ScreenShotVC *screenshot_VC = [[ScreenShotVC alloc]init];
        [self.navigationController pushViewController:screenshot_VC animated:YES];
    }else if (indexPath.row == 5) {
        ShakeVC *shake_VC = [[ShakeVC alloc]init];
        [self.navigationController pushViewController:shake_VC animated:YES];
    }else if (indexPath.row == 6) {
        DCAnimationKitVC *animationKit_VC = [[DCAnimationKitVC alloc]init];
        [self.navigationController pushViewController:animationKit_VC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
