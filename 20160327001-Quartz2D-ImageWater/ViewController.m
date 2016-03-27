//
//  ViewController.m
//  20160327001-Quartz2D-ImageWater
//
//  Created by Rainer on 16/3/27.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.获取原始图片
    UIImage *oldImage = [UIImage imageNamed:@"小黄人"];
    
    // 2.创建一个位图上下文
    // 第一个参数size:上下文大小
    // 第二个参数opaque:不透明（YES：不透明；NO：透明；）一般都采用透明的上下文
    // 第三个参数scale:缩放比例（通常不需要缩放上下文，取值为0表示不缩放）
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0);

    // 3.绘制原生图片到上下文
    [oldImage drawAtPoint:CGPointZero];
    
    // 4.给图片上下文绘入文字
    NSString *waterString = @"Quartz2D水印测试";
    
    NSMutableDictionary *attributesDictionary = [NSMutableDictionary dictionary];
    
    attributesDictionary[NSForegroundColorAttributeName] = [UIColor redColor];
    attributesDictionary[NSFontAttributeName] = [UIFont systemFontOfSize:18 weight:10];
    
    [waterString drawAtPoint:CGPointMake(120, 528) withAttributes:attributesDictionary];
    
    // 这里也可以采用一些基本的画图方式将其它图形画入当前的上下文中
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
//    
//    [bezierPath stroke];
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextMoveToPoint(context, 50, 50);
//    CGContextAddLineToPoint(context, 200, 200);
//
//    [[UIColor greenColor] set];
//
//    CGContextStrokePath(context);
    
    // 5.从上下文中生成一张带水印的新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    // 展示带水印的图片
    self.imageView.image = newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
