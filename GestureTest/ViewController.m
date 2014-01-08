//
//  ViewController.m
//  GestureTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImage;

@end

@implementation ViewController

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)gesture
{
    self.ballImage.transform = CGAffineTransformRotate(self.ballImage.transform, gesture.rotation);
    
    // 연속된 값으로 반환되므로 0으로 초기화
    [gesture setRotation:0.0];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.view];
    self.ballImage.center = point;
}

// 확대/축소
- (void)handlePinch:(UIPinchGestureRecognizer *)gesture
{
    CGFloat scale = gesture.scale;
    self.ballImage.transform = CGAffineTransformScale(self.ballImage.transform, scale, scale);
    
    // 연속된 값으로 반환되므로 1로 초기화
    [gesture setScale:1.0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // 코드로 제스처 등록
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.ballImage addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.ballImage addGestureRecognizer:pinch];

    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [self.ballImage addGestureRecognizer:rotate];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
