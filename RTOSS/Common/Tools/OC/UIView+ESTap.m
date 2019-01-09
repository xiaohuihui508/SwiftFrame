//
//  UIView+ESTap.m
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "UIView+ESTap.h"

@implementation UIView (ESTap)

- (void)tapHandle:(TapAction)block {
    
    self.userInteractionEnabled = YES;
    UIButton *btn = [UIButton new];
    [self addSubview:btn];
    btn.backgroundColor = [UIColor clearColor];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    //RAC 信号源的方法
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (block) {
            block();
        }
    }];
    
}

@end
