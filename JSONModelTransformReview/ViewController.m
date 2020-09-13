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
@property (weak, nonatomic) IBOutlet UISegmentedControl *modelTypeSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *transTypeSeg;

@property (nonatomic, strong) NSDictionary *statusJson;
@property (nonatomic, strong) NSDictionary *userJson;

@end

@implementation ViewController

- (NSDictionary *)statusJson{
    if (!_statusJson) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        _statusJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    }
    return _statusJson;
}

- (NSDictionary *)userJson{
    if (!_userJson) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"user" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        _userJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    }
    return _userJson;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tf endEditing:YES];
}
- (IBAction)resetClick:(id)sender {
    self.mjLab.text = @"--";
    self.yyLab.text = @"--";
}

- (IBAction)mj_click:(id)sender {
    NSMutableArray* dataArr = [NSMutableArray array];
    NSTimeInterval begin = CACurrentMediaTime();
    Class cls = (self.modelTypeSeg.selectedSegmentIndex == 0) ? [MJWeiboStatus class] : [MJGHUser class];
    NSDictionary* json = (self.modelTypeSeg.selectedSegmentIndex == 0) ? self.statusJson : self.userJson;
    id model = [cls mj_objectWithKeyValues:json];
    [NSObject mj_resetCirclesCount];
    @autoreleasepool {
        if (self.transTypeSeg.selectedSegmentIndex == 0) {
            // JSON 2 Model
            for (int i = 0; i < [self.tf.text integerValue]; i++) {
                id feed = [cls mj_objectWithKeyValues:json];
                [dataArr addObject:feed];
            }
        }else{
            // Model 2 JSON
            for (int i = 0; i < [self.tf.text integerValue]; i++) {
                id dict = [model mj_keyValues];
                [dataArr addObject:dict];
            }
        }
    }
    NSTimeInterval end = CACurrentMediaTime();
    [NSObject mj_printfCount];
    self.mjLab.text = [NSString stringWithFormat:@"%8.2f 毫秒",(end - begin) * 1000];
}

- (IBAction)yy_click:(id)sender {
    NSMutableArray* dataArr = [NSMutableArray array];
    NSTimeInterval begin = CACurrentMediaTime();
    Class cls = (self.modelTypeSeg.selectedSegmentIndex == 0) ? [YYWeiboStatus class] : [YYGHUser class];
    NSDictionary* json = (self.modelTypeSeg.selectedSegmentIndex == 0) ? self.statusJson : self.userJson;
    id model = [cls yy_modelWithJSON:json];
    [NSObject yy_resetCirclesCount];
    @autoreleasepool {
        if (self.transTypeSeg.selectedSegmentIndex == 0) {
            // JSON 2 Model
            for (int i = 0; i < [self.tf.text integerValue]; i++) {
                id feed = [cls yy_modelWithJSON:json];
                [dataArr addObject:feed];
            }
        }else{
            // Model 2 JSON
            for (int i = 0; i < [self.tf.text integerValue]; i++) {
                id dict = [model yy_modelToJSONObject];
                [dataArr addObject:dict];
            }
        }
    }
    NSTimeInterval end = CACurrentMediaTime();
    [NSObject yy_printfCount];
    self.yyLab.text = [NSString stringWithFormat:@"%8.2f 毫秒",(end - begin) * 1000];
}

@end
