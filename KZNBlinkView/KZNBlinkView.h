#pragma mark - KZNBlinkView
@interface KZNBlinkView : UIView {
}


#pragma mark - property
@property (nonatomic, assign) NSInteger blinkCount;
@property (nonatomic, assign) CGFloat blinkInterval;
@property (nonatomic, assign) CGFloat waitInterval;
@property (nonatomic, copy) void (^ blinkingDidEndBlock)(void);


#pragma mark - class method
+ (void)showBlinkWithBlinkColor:(UIColor *)blinkColor
                  blinkInterval:(CGFloat)blinkInterval;

+ (void)showBlinkWithBlinkColor:(UIColor *)blinkColor
                     blinkCount:(NSInteger)blinkCount
                  blinkInterval:(CGFloat)blinkInterval
                   waitInterval:(CGFloat)waitInterval;


#pragma mark - initializer
- (id)initWithBlinkColor:(UIColor *)blinkColor
           blinkInterval:(CGFloat)blinkInterval;

- (id)initWithBlinkColor:(UIColor *)blinkColor
              blinkCount:(NSInteger)blinkCount
           blinkInterval:(CGFloat)blinkInterval
            waitInterval:(CGFloat)waitInterval;


#pragma mark - api
- (void)setBlinkColor:(UIColor *)blinkColor
           blinkCount:(NSInteger)blinkCount
        blinkInterval:(CGFloat)blinkInterval
         waitInterval:(CGFloat)waitInterval;

- (void)startBlinking;

- (void)stopBlinking;


@end
