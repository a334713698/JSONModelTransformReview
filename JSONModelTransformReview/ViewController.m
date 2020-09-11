//
//  ViewController.m
//  JSONModelTransformReview
//
//  Created by fcn on 2020/9/11.
//  Copyright © 2020 hdj. All rights reserved.
//

#import "ViewController.h"
#import "YYWeiboModel.h"
#import "MJWeiboModel.h"
#import "GitHubUser.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UILabel *mjLab;
@property (weak, nonatomic) IBOutlet UILabel *yyLab;
@property (weak, nonatomic) IBOutlet UISegmentedControl *SEG;

@property (nonatomic, strong) NSDictionary *json;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /// get json data
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tf endEditing:YES];
}

- (IBAction)mj_click:(id)sender {
    NSMutableArray* dataArr = [NSMutableArray array];
    NSTimeInterval begin = CACurrentMediaTime();
    Class cls = (self.SEG.selectedSegmentIndex == 0) ? [MJWeiboStatus class] : [MJGHUser class];
    @autoreleasepool {
        for (int i = 0; i < [self.tf.text integerValue]; i++) {
            id feed = [cls mj_objectWithKeyValues:self.json];
            [dataArr addObject:feed];
        }
    }
    NSTimeInterval end = CACurrentMediaTime();
    self.mjLab.text = [NSString stringWithFormat:@"%8.2f 毫秒",(end - begin) * 1000];
}

- (IBAction)yy_click:(id)sender {
    NSMutableArray* dataArr = [NSMutableArray array];
    NSTimeInterval begin = CACurrentMediaTime();
    Class cls = (self.SEG.selectedSegmentIndex == 0) ? [YYWeiboStatus class] : [MJGHUser class];
    @autoreleasepool {
        for (int i = 0; i < [self.tf.text integerValue]; i++) {
            id feed = [cls yy_modelWithJSON:self.json];
            [dataArr addObject:feed];
        }
    }
    NSTimeInterval end = CACurrentMediaTime();
    self.yyLab.text = [NSString stringWithFormat:@"%8.2f 毫秒",(end - begin) * 1000];
}

@end
