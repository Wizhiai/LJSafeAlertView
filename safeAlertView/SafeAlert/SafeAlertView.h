//
//  SafeAlertView.h
//  huashida_home
//
//  Created by x d on 2020/4/15.
//  Copyright © 2020 苏州梦想人软件科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SafeAlertView : UIView
@property (copy, nonatomic) void(^closeAlertViewBlock)(int  selected);
@property (strong,nonatomic) id backgroundImage;
@property (strong,nonatomic) id closeBtnImage;
@property (strong,nonatomic) id selectedImage;
@property (strong,nonatomic) id unSelectedImage;
@property (strong,nonatomic) NSString * alertTitle;
@end

NS_ASSUME_NONNULL_END
