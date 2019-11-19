//
//  ViewController.m
//  SegmentBrazeDebounce-iOS
//
//  Created by Brandon Sneed on 11/4/19.
//  Copyright © 2019 Brandon Sneed. All rights reserved.
//

#import "ViewController.h"

@import Analytics;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textField.text = @"SomeUser";
}

- (IBAction)sendIdentifyAction:(id)sender {
    [[SEGAnalytics sharedAnalytics] identify:self.textField.text];
}

@end
