//
//  ViewController.m
//  JPSpamGestureRecognizerExample
//
//  Created by Justin Poliachik on 11/30/14.
//  Copyright (c) 2014 justinpoliachik. All rights reserved.
//

#import "ViewController.h"
#import "JPSpamGestureRecognizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JPSpamGestureRecognizer *spamGesture = [[JPSpamGestureRecognizer alloc] initWithTarget:self action:@selector(onSpam)];
    spamGesture.numberOfTapsPerSecondRequired = 4;
    spamGesture.recognizedBlock = ^{
        // alternate gesture recognizer block
    };
    
    [self.view addGestureRecognizer:spamGesture];
}

- (void)onSpam
{
    UIView *spamView = [[[NSBundle mainBundle] loadNibNamed:@"SpamView" owner:self options:nil] firstObject];
    spamView.center = self.view.center;
    
    [self.view addSubview:spamView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [spamView removeFromSuperview];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
