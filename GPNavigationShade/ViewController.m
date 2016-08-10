//
//  ViewController.m
//  GPNavigationShade
//
//  Created by 高盼盼 on 16/8/10.
//  Copyright © 2016年 高盼盼. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+BgColor.h"
//即图片的高度
#define kHeaderHeight 150

@interface ViewController ()

@property (nonatomic,weak) UIImageView * headerImage;
@property (weak, nonatomic) IBOutlet UIView *scrollBg;

@end

@implementation ViewController

- (UIImageView *)headerImage{
    if (!_headerImage) {
        UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"20150606161932_cNAGR.thumb.700_0"]];
        image.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
        [self.scrollBg addSubview:image];
        self.headerImage = image;
    }
    return _headerImage;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];//用于去除导航栏的底线，也就是周围的边线
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self headerImage];
    self.title = @"导航栏渐变";
    [self.navigationController.navigationBar gpSetBackgroundColor:[UIColor clearColor]];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar gpReset];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor *color = [UIColor colorWithRed:0.54f green:0.86f blue:0.99f alpha:1.00f];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY <= kHeaderHeight-64) {
        CGFloat alpha = MIN(1, offsetY/(kHeaderHeight-64));
        [self.navigationController.navigationBar gpSetBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
            } else {
        [self.navigationController.navigationBar gpSetBackgroundColor:[color colorWithAlphaComponent:1]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
