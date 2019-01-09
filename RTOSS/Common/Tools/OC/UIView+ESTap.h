//
//  UIView+ESTap.h
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * _Nonnull (^TapAction)(void);

@interface UIView (ESTap)

- (void)tapHandle:(TapAction)block;

@end

NS_ASSUME_NONNULL_END
