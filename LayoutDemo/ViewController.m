//
//  ViewController.m
//  LayoutDemo
//
//  Created by kaxiaoer on 14-10-17.
//  Copyright (c) 2014年 miaogaoliang. All rights reserved.
//

/**
 about autolayout 
// 1. view add subview
// 2 设置属性， autosize  constrain  NO
        view.translateAutoresizingMaskIntoConstrains = NO;
    3. 规则 y = m*x + b;  y,x view m 系数， b 参数
 
 button.left = (container.left + 20), which in turn is an expression of the form y = m*x + b,
 where:
 y and x are attributes of views.
 m and b are floating point values.
 
 */
#import "ViewController.h"
#import "UIView+MGLConstaint.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    
    
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
//    lab.translatesAutoresizingMaskIntoConstraints = NO;
//    lab.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:lab];
//    
//    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:10];
//
////    NSLayoutAttributeBaseline/NSLayoutAttributeBottom 可以认为底边相同，保持底边相同
//    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBaseline multiplier:1 constant:-10];
//    
//    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:10];
//    
//    NSLayoutConstraint *rightConstrait= [NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
//    
//    [self.view addConstraint:topConstraint];
//    [self.view addConstraint:bottonConstraint];
//    [self.view addConstraint:leftConstraint];
//    [self.view addConstraint:rightConstrait];
    
//    [self testEdge];
//    [self testCenterXY];
    [self testMoreViews];
}

#pragma mark - sigletion view
//设置到 superView edge
- (void)testEdge{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
    lab.translatesAutoresizingMaskIntoConstraints = NO;
    lab.backgroundColor = [UIColor greenColor];
    [self.view addSubview:lab];
    
//    methed 1
    [lab setBottom:30];
    [lab setLeft:50];
    [lab setWidth:100];
    [lab setHeight:200];

//    methed 2
    [lab setEdge:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    
//    [lab setRotia:0.5 layoutAttribute:NSLayoutAttributeWidth withView:self.view];
//    [lab setRotia:0.5 layoutAttribute:NSLayoutAttributeHeight withView:self.view];
//    [lab setRotia:0.1 layoutAttribute:NSLayoutAttributeWidth withView:self.view];
    
//
//    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectZero];
//    lab2.translatesAutoresizingMaskIntoConstraints = NO;
//    lab2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:lab2];
//    
//    [lab2 equalAttribute:NSLayoutAttributeHeight withView:lab];
//    [lab2 setRotia:0.5 layoutAttribute:NSLayoutAttributeWidth withView:lab];
//    [lab2 setAlignView:lab ofAttribute:NSLayoutAttributeLeading constaint:-10];
//    [lab2 setAlignView:lab ofAttribute:NSLayoutAttributeTop constant:-10];
//    [lab2 setAlignView:lab ofAttribute:NSLayoutAttributeTop constant:-30];
}
- (void)testCenterXY{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
    lab.translatesAutoresizingMaskIntoConstraints = NO;
    lab.backgroundColor = [UIColor greenColor];
    [self.view addSubview:lab];
    
    [lab setRotia:0.5 layoutAttribute:NSLayoutAttributeHeight withView:self.view];
    [lab setRotia:0.5 layoutAttribute:NSLayoutAttributeWidth withView:self.view];
    [lab setCenterX:0 multiplier:1.2];
    [lab setCenterY:0];
}

#pragma mark - more views
- (UILabel *)labFont:(UIFont *)font
            isLayout:(BOOL)isLayout
           textColor:(UIColor *)textColor
     backgroundColor:(UIColor *)bgColor{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:lab];
    lab.translatesAutoresizingMaskIntoConstraints = !isLayout;
    lab.textColor = textColor ? textColor : lab.textColor;
    lab.font = font ? font : lab.font;
    lab.backgroundColor = bgColor ? bgColor : lab.backgroundColor;
    lab.textAlignment = NSTextAlignmentCenter;
    return lab;
}

- (void)testMoreViews{
    UILabel *lab1 = [self labFont:nil isLayout:YES textColor:nil backgroundColor:[UIColor greenColor]];
    lab1.text  = @"hello world";
    UILabel *lab2 = [self labFont:[UIFont systemFontOfSize:30] isLayout:YES textColor:nil backgroundColor:[UIColor redColor]];
    lab2.text = @"hello oc";
    
    UILabel *lab3 = [self labFont:[UIFont systemFontOfSize:30] isLayout:YES textColor:nil backgroundColor:[UIColor redColor]];
    lab3.text = @"hello lab";
    
    [lab1 setCenterX:0];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(lab1,lab2,lab3);
    
    [self.view relateViewBings:views
                        visual:@"V:|-10-[lab1(==100)][lab2][lab3(==lab2)]-|"
                 formatOptions:NSLayoutFormatAlignAllRight];
    
//    默认有共同的 baseline

//    top lab1.top 为准
//    baseline  lab1.字的baseline 为准
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[lab1]-0-[lab2]-100-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:views];
//    [self.view addConstraints:constraints];
    

//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[lab2]-0-[lab1]-0-[lab3]-50-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
//    [self.view addConstraints:constraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
