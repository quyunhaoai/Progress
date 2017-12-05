//
//  ViewController.m
//  Progress
//
//  Created by hao on 2017/10/25.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "ViewController.h"
#import "progressView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet progressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *myimageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://xx.zpzxcn.com/timg.jpg?imageView2/0/format/jpg/q/20|watermark/2/text/6YeM6LWa/font/5b6u6L2v6ZuF6buR/fontsize/240/fill/IzgzNzI3Mg==/dissolve/100/gravity/SouthEast/dx/10/dy/10|imageslim"]];
    NSLog(@"%@",data);
    self.myimageView.image = [UIImage imageWithData:data];
}
static int _i;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _i ++;
    if (_i == 4) {
        _i = 1;
    }
    self.myimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"无标题%d",_i]];

    CATransition *anim = [CATransition  animation];
    anim.duration = 1;
//    anim.type = @"push";
    anim.type = @"pageCurl";
//    anim.startProgress = 0.3;
//    anim.endProgress = 0.5;
    [self.myimageView.layer addAnimation:anim forKey:nil];
}
- (IBAction)ValueChang:(UISlider *)sender {
    
    NSLog(@"%.2f%%",sender.value);
    
    self.myLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value];
    
    self.progressView.progressValue = sender.value;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
