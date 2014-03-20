#import "KZNBlinkViewDemoViewController.h"
#import "KZNBlinkView.h"


#pragma mark - constant
static const NSInteger KZNDemoCountLabelMin = 0;
static const NSInteger KZNDemoCountLabelMax = 5;


#pragma mark - KZNBlinkViewDemoViewController
@implementation KZNBlinkViewDemoViewController


#pragma mark - synthesize
@synthesize countLabel;
@synthesize substractionButton;
@synthesize additionButton;


#pragma mark - event listener
- (IBAction)touchedUpInsideWithButton:(UIButton *)button
{
    if (button == self.substractionButton) {
        [self countUpWithInteger:-1];
    }
    else if (button == self.additionButton) {
        [self countUpWithInteger:1];
    }
}


#pragma mark - private api
- (void)countUpWithInteger:(NSInteger)integer
{
    NSInteger currentValue = [self.countLabel.text integerValue];
    NSInteger afterValue = currentValue + integer;
    if (afterValue < KZNDemoCountLabelMin || afterValue > KZNDemoCountLabelMax) {
        // blink
        [KZNBlinkView showBlinkWithBlinkColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.3f]
                                blinkInterval:0.15f];

        afterValue = currentValue;
    }
    [self.countLabel setText:[NSString stringWithFormat:@"%ld", afterValue]];
}


@end

