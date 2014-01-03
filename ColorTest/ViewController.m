//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    // 슬라이더의 초기값으로 색상설정
    [self onColorSliderChanged:nil];
}

-(IBAction)onColorSliderChanged:(id)sender{
    // 인디케이터가 동작중이면 중지
    if ([_activityIndicator isAnimating]) {
        [_activityIndicator stopAnimating];
    }
    _colorView.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1.0];
}
-(IBAction)powerOnOff:(id)sender{
    BOOL isOn = ((UISwitch *)sender).on;
    
    _redSlider.enabled = isOn;
    _greenSlider.enabled = isOn;
    _blueSlider.enabled = isOn;
    
    if (isOn) {
        // 액티비티인디케이터 시작
        [_activityIndicator startAnimating];
        // 1초 뒤에 현재 색상으로 변경
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
        
    }
    else
    {
        //OFF 상태면 회색상태로 변경
        _colorView.backgroundColor = [UIColor grayColor];
    }
    
}
@end
