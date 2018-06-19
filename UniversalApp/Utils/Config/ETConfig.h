//
//  ETConfig.h
//  UniversalApp
//
//  Created by 诺虹科技 on 13/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WEAKSELF __weak typeof(self) weakSelf = self
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define length_change   ((ScreenWidth-56)/2)
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define WEAKSELF __weak typeof(self) weakSelf = self
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])
#define ViewY  self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height
#define ConvientlyLogin     [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"login"] animated:YES];
extern NSString *const mediumFont;
extern NSString *const lightFont;
extern NSString *const regularFont;
extern NSString *const normalRed;
extern NSString *const boldFont;
extern NSString *const SimSunFont;
extern NSString *const PingFangSCMedium;


//extern 

