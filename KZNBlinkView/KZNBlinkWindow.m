#import "KZNBlinkWindow.h"


#pragma mark - KZNBlinkWindow
@interface KZNBlinkWindow ()


#pragma mark - property
@property (weak) UIWindow* previousKeyWindow;


@end


#pragma mark - KZNBlinkWindow
@implementation KZNBlinkWindow


#pragma mark - synthesize
@synthesize previousKeyWindow;


#pragma mark - initializer
- (id)init
{
  if ((self = [super init])) {
    self.frame = [[UIScreen mainScreen] bounds];
  }
  return self;
}


#pragma mark - api
- (void)makeKeyAndVisible
{
  self.previousKeyWindow = [[UIApplication sharedApplication] keyWindow];
  self.windowLevel = UIWindowLevelAlert;
  [super makeKeyAndVisible];
}

- (void)resignKeyWindow
{
  [super resignKeyWindow];
  [self.previousKeyWindow makeKeyAndVisible];
}


@end
