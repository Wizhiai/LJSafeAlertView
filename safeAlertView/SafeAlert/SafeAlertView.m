//
//  SafeAlertView.m
//  huashida_home
//
//  Created by x d on 2020/4/15.
//  Copyright © 2020 苏州梦想人软件科技有限公司. All rights reserved.
//
//获取屏幕 宽度、高度
#define SCREEN_WIDTH_DEVICE ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT_DEVICE ([UIScreen mainScreen].bounds.size.height)

#import "SafeAlertView.h"
#import "Masonry.h"

@implementation SafeAlertView{
    BOOL radioState;
    UIButton* radioButton ;
    UIView *alphaView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI:frame];//
        radioState = false;
    }
    return self;
}
-(void)setUI:(CGRect)frame {
    
    float muti = 0.75 ;
    float scale = 0.99;
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:self.frame];
    backgroundView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
    [self addSubview:backgroundView];
    
    float imageViewWidth = scale * SCREEN_WIDTH_DEVICE ;
    float imageViewHeight = imageViewWidth / muti ;
    //安全提示图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH_DEVICE - imageViewWidth) / 2, (SCREEN_HEIGHT_DEVICE - imageViewHeight) / 3, imageViewWidth, imageViewHeight)];
    if(self.backgroundImage)  {imageView.image = [self getImage:self.backgroundImage];}
    else {
    imageView.image = [UIImage imageNamed:@"img_popwinz_arwarning.png"];
    }
    //选择按钮
    radioButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH_DEVICE * 0.3,40)];
    radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    radioButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    radioButton.frame = CGRectMake(SCREEN_WIDTH_DEVICE * 0.7 / 2,imageView.frame.size.height - 70,SCREEN_WIDTH_DEVICE * 0.3,40);

    [radioButton setTitle:@"  I got it" forState:UIControlStateNormal];
    if(self.alertTitle)[radioButton setTitle:self.alertTitle forState:UIControlStateNormal];
    [radioButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    radioButton.titleLabel.font = [UIFont systemFontOfSize: 16];
   
    UIImage *selectedImage = nil;
    UIImage *unSelectedImage = nil;
    if(self.selectedImage){
        selectedImage = [self getImage:self.selectedImage];
    }else{
        selectedImage = [UIImage imageNamed:@"img_radiochack_select"];
    }
    if(self.unSelectedImage){
        unSelectedImage = [self getImage:self.unSelectedImage];
    }else{
        unSelectedImage = [UIImage imageNamed:@"img_radiochack"];
    }
    
    [radioButton setImage:unSelectedImage forState:UIControlStateNormal];
    [radioButton setImage:selectedImage forState:UIControlStateSelected];
    // 设置按钮在 Highlighted 下的状态属性
    [radioButton setImage:selectedImage forState:UIControlStateHighlighted];
    [radioButton setImage:selectedImage forState:UIControlStateHighlighted | UIControlStateSelected];
    
    [radioButton addTarget:self action:@selector(onRadioButtonValueChanged) forControlEvents:UIControlEventTouchUpInside];
    imageView.userInteractionEnabled = YES ;
    [imageView addSubview:radioButton];
    [radioButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.width.equalTo(imageView);
        make.bottom.mas_equalTo(imageView.mas_bottom).offset(-imageView.frame.size.height * 0.05);
    }];
    
    UIImage *closeBtnImage = nil;
      if(self.closeBtnImage){
          closeBtnImage = [self getImage:self.closeBtnImage];
      }else{
          closeBtnImage = [UIImage imageNamed:@"icon_popwinz_closebtn"];
      }
    
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE * 0.75 / 2,SCREEN_HEIGHT_DEVICE - 80 ,SCREEN_WIDTH_DEVICE * 0.25,SCREEN_WIDTH_DEVICE * 0.25 )];
    [closeButton setImage:closeBtnImage forState:UIControlStateNormal];
    [backgroundView addSubview:imageView];
    [backgroundView addSubview:closeButton];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-60);
    }];
    [closeButton addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)onRadioButtonValueChanged {
    radioState = !radioState;
    radioButton.selected = !radioButton.selected;
    
    
}

-(void)removeView {
   
    if(radioState)//选择不再展现
    {
        if (self.closeAlertViewBlock) {
            self.closeAlertViewBlock(1);
        }
    }else{
        if (self.closeAlertViewBlock) {
            self.closeAlertViewBlock(0);
        }
    }
    [self removeFromSuperview];
    
    
    
}

#pragma mark --根据参数获取图片

-(UIImage *)getImage:(id)imageParameter{
    if(!imageParameter) return nil;
    UIImage *image;
    if([imageParameter  isKindOfClass:[NSString class]]){   //判断传过来的是否是字符串还是UIImage
       NSString *imageNameString = (NSString *)imageParameter;
        image = [UIImage imageNamed:imageNameString];
    }else if([imageParameter  isKindOfClass:[UIImage class]]){
        image =(UIImage *)imageParameter;
    }
    return image;;
}

@end
