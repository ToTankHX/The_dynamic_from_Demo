//
//  ViewController.m
//  The_dynamic_from_Demo
//
//  Created by 1990-2 on 15/7/15.
//  Copyright (c) 2015年 1990-2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(10, 100, 200, 0);
    self.label.font = [UIFont systemFontOfSize:18];
    self.label.numberOfLines = 0;
    self.label.backgroundColor = [UIColor grayColor];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"here for me  and some one is  ommr,raigr jskdjajdkasjdk jkad jajdka ajdjaskdjkas"];
    NSRange range = {0,[string length]};
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    
    self.label.attributedText = string;
    CGFloat height = [self sizeWithString:self.label];
    self.label.frame = CGRectMake(10, 100, 200, height);
    
    [self.view addSubview:_label];
    //create dataSource
    
//    [self createTabelView];
}

- (CGFloat)sizeWithString:(UILabel*)string{
    CGSize size = CGSizeMake(string.frame.size.width, 300);
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGRect contextSize = [string.text boundingRectWithSize:size
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:string.font}
                                            context:context];
    return contextSize.size.height;

}
#pragma mark crete tableview
- (void)createTabelView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIView *view = [[UIView alloc] init];
    [self.tableView setTableFooterView:view];
    //use uiview shielding excess number of lines.
    
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static UITableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    });
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
