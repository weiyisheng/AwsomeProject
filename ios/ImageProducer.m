//
//  ImageProducer.m
//  AluClientApp
//
//  Created by gemini on 8/11/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ImageProducer.h"

@implementation ImageProducer

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending hahahahaha to create an event %@ at %@", name, location);
}

+(NSString*) createFilePath:(NSString*)suffix
{
  NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *docsDir = [dirPaths objectAtIndex:0];
  NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:suffix]];
  
  return databasePath;
}

RCT_EXPORT_METHOD(createTopViewPNG:(RCTResponseSenderBlock)callback)
{
  UIView *imageView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
  
  UIGraphicsBeginImageContext(imageView.bounds.size);
  [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  NSData *imageData = UIImagePNGRepresentation(image);
  
  NSString *path = [ImageProducer createFilePath:@"from_nib_pic.png"];
  
  [imageData writeToFile:path atomically:YES];
  
  callback(@[[NSNull null], path]);
}

RCT_EXPORT_METHOD(screenShot:(RCTResponseSenderBlock)callback)
{
  UIWindow *mainWindow = [[[UIApplication sharedApplication] windows] firstObject];
  
  
  if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    UIGraphicsBeginImageContextWithOptions(mainWindow.viewForLastBaselineLayout.bounds.size, NO, [UIScreen mainScreen].scale);
  else
    UIGraphicsBeginImageContext(mainWindow.viewForLastBaselineLayout.bounds.size);
  
  [mainWindow.viewForLastBaselineLayout.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  NSData * imgData = UIImagePNGRepresentation(image);
  
  NSString *path = [ImageProducer createFilePath:@"from_screen_shoot_pic.png"];
  [imgData writeToFile:path atomically:YES];
  callback(@[[NSNull null], path]);
}


@end
