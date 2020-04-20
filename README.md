# LJSafeAlertView
安全提示框复用



- 使用方法：

  `引入头文件\#import "SafeAlertView.h"`

- 创建对象，并初始化，获取回调函数



 `SafeAlertView *safeAlertView = [[SafeAlertView alloc]initWithFrame:**self**.view.frame];`

  `safeAlertView.alertTitle = @"安全提示";`

`//图片可传对象或者字符串，选择按钮和关闭按钮也可传自定义图片`

`//  safeAlertView.backgroundImage = [UIImage   imageNamed:@"img_popwinz_arwarning"];`

   `safeAlertView.backgroundImage = @"img_popwinz_arwarning";`

  `[**self**.view addSubview: safeAlertView];`

  `safeAlertView.closeAlertViewBlock = ^(**int** selected){`

​    `**if**(selected == 1){`

​      `NSLog(@"选择了不再弹出提示！");`

​    `}`

  `};``![截屏2020-04-20 下午8.16.39](README.assets/%E6%88%AA%E5%B1%8F2020-04-20%20%E4%B8%8B%E5%8D%888.16.39.png)