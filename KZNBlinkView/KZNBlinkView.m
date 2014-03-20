#import "KZNBlinkView.h"
#import "KZNBlinkWindow.h"


#pragma mark - KZNBlinkView
@interface KZNBlinkView ()


@property (nonatomic, strong) UIWindow *backgroundWindow;
@property (nonatomic, assign) BOOL isStopBlinking;


@end


#pragma mark - KZNBlinkView
@implementation KZNBlinkView


#pragma mark - property
@synthesize blinkCount;
@synthesize blinkInterval;
@synthesize waitInterval;
@synthesize blinkingDidEndBlock;
@synthesize backgroundWindow;
@synthesize isStopBlinking;


#pragma mark - class method
+ (void)showBlinkWithBlinkColor:(UIColor *)color
                  blinkInterval:(CGFloat)bInterval
{
    [KZNBlinkView showBlinkWithBlinkColor:color
                               blinkCount:1
                            blinkInterval:bInterval
                             waitInterval:0.0f];
}

+ (void)showBlinkWithBlinkColor:(UIColor *)color
                     blinkCount:(NSInteger)count
                  blinkInterval:(CGFloat)bInterval
                   waitInterval:(CGFloat)wInterval
{
    KZNBlinkView *view = [[KZNBlinkView alloc] initWithBlinkColor:color
                                                       blinkCount:count
                                                    blinkInterval:bInterval
                                                     waitInterval:wInterval];
    view.backgroundWindow = [KZNBlinkWindow new];
    [view.backgroundWindow makeKeyAndVisible];
    view.frame = CGRectMake(0, 0, view.backgroundWindow.frame.size.width, view.backgroundWindow.frame.size.height);
    [view.backgroundWindow addSubview:view];

    [view startBlinking];
}


#pragma mark - initializer
- (void)awakeFromNib
{
    [super awakeFromNib];

    // Default Setting
    [self setBlinkColor:self.backgroundColor
             blinkCount:1
          blinkInterval:0.15f
           waitInterval:0.0f];
}

- (id)initWithBlinkColor:(UIColor *)color
           blinkInterval:(CGFloat)bInterval
{
    self = [self initWithBlinkColor:color
                         blinkCount:1
                      blinkInterval:bInterval
                       waitInterval:0.0f];
    if (self) {
    }
    return self;
}

- (id)initWithBlinkColor:(UIColor *)color
              blinkCount:(NSInteger)count
           blinkInterval:(CGFloat)bInterval
            waitInterval:(CGFloat)wInterval
{
    self = [super init];
    if (self) {
        self.isStopBlinking = NO;
        [self setBlinkColor:color
                 blinkCount:count
              blinkInterval:bInterval
               waitInterval:wInterval];
    }
    return self;
}


#pragma mark - release
- (void)dealloc
{
    [self cleanup];
}


#pragma mark - api
- (void)setBlinkColor:(UIColor *)color
           blinkCount:(NSInteger)count
        blinkInterval:(CGFloat)bInterval
         waitInterval:(CGFloat)wInterval
{
    [self setBackgroundColor:color];
    self.blinkCount = count;
    self.blinkInterval = bInterval / 2.0f;
    self.waitInterval = wInterval;
}

- (void)startBlinking
{
    [self onBlinking];
}

- (void)stopBlinking
{
    self.isStopBlinking = YES;
    self.blinkingDidEndBlock = NULL;
}


#pragma mark - private api
- (void)cleanup
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(onBlinking)
                                               object:nil];
    if (self.window) { [self.window resignKeyWindow]; }
    [self removeFromSuperview];
    self.backgroundWindow = nil;
}

- (void)onBlinking
{
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^ () {
        if (weakSelf.isStopBlinking) {
            [weakSelf endBlinking];
            return;
        }

        weakSelf.blinkCount--;
        weakSelf.alpha = 0;

        [UIView animateWithDuration:weakSelf.blinkInterval
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^ () {
            weakSelf.alpha = 1;
        }
                         completion:^ (BOOL finished) {
            [weakSelf offBlinking];
        }];

    });
}

- (void)offBlinking
{
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^ () {
        if (weakSelf.isStopBlinking) {
            [weakSelf endBlinking];
            return;
        }

        weakSelf.alpha = 1;

        [UIView animateWithDuration:weakSelf.blinkInterval
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^ () {
            weakSelf.alpha = 0;
        }
                         completion:^ (BOOL finished) {
            if (weakSelf.blinkCount <= 0) {
                [weakSelf endBlinking];
            }
            else {
                [weakSelf waitBlinking];
            }
        }];

    });
}

- (void)waitBlinking
{
    if (self.isStopBlinking) {
        [self endBlinking];
        return;
    }

    [self performSelector:@selector(onBlinking)
               withObject:nil
               afterDelay:self.waitInterval];
}

- (void)endBlinking
{
    if (self.blinkingDidEndBlock) {
        self.blinkingDidEndBlock();
    }
    [self cleanup];
}


@end
