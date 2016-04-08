//
//  ShowDetailView.m
//  ShowDetailText
//
//  Created by Wangchaoqun on 16/4/6.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "ShowDetailView.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SELF_WIDTH ((SCREEN_WIDTH) * (0.8))
#define SELF_HEIGHT ((SCREEN_HEIGHT) * (0.2))

@interface ShowDetailView()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *errText;
@property (assign,nonatomic) BOOL isTransfrom;
@property (strong,nonatomic) NSString* titleString;
@property (strong,nonatomic) NSString* messageString;
@property (strong,nonatomic) UIWindow* overlayWindow;

@end

@implementation ShowDetailView
@synthesize overlayWindow;

+ (ShowDetailView*)instance
{
    static ShowDetailView* detailView = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        detailView = [[self alloc]init];
    });
    return detailView;
}

- (instancetype)initWithTitle:(NSString *)title AndContentText:(NSString *)contentText
{
    NSAssert(title != nil, @"title == nil");
    NSAssert(contentText != nil, @"contentText == nil");
    
    [self baseInit];
    self.titleString = title;
    self.messageString = contentText;
    
    [self setTitleLabelText];
    [self showWindow];

    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *objects = [[NSBundle mainBundle]loadNibNamed:@"ShowDetailView" owner:nil options:nil];
        self = [objects firstObject];
        [self baseInit];
    }
    return self;
}

- (void)setTitleLabelText
{
    UIView* indexView = [self viewWithTag:1111];
    UILabel *titleLabel = [indexView viewWithTag:101];
    titleLabel.text = self.titleString;
}

- (void)baseInit
{
    self.isTransfrom = NO;
    self.bounds = CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT);
    self.center = CGPointMake(SCREEN_WIDTH / 2., SCREEN_HEIGHT / 2.);
}

- (void)showWindow
{
    [self.overlayWindow addSubview:self];
    self.overlayWindow.userInteractionEnabled = YES;
    [self.overlayWindow makeKeyAndVisible];
}

- (UIWindow *)overlayWindow {
    if(!overlayWindow) {
        overlayWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        overlayWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlayWindow.backgroundColor = [UIColor grayColor];
        overlayWindow.alpha = .95;
        overlayWindow.userInteractionEnabled = NO;
    }
    return overlayWindow;
}

- (IBAction)swipeContentView:(id)sender {
    if (!self.isTransfrom) {
        [UIView transitionFromView:[self.contentView viewWithTag:101] toView:[self.contentView viewWithTag:102] duration:1. options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            UILabel *contentLabel = [self.contentView viewWithTag:102];
            contentLabel.numberOfLines = 0;
            contentLabel.text = self.messageString;
            
            self.bounds = CGRectMake(0, 0, CGRectGetWidth(self.bounds), [self heightOfContentText] + SELF_HEIGHT);
            [self layoutIfNeeded];
            
            self.isTransfrom = TRUE;
            self.errText.text = @"错误详情";
        }];
    }
}

- (CGFloat)heightOfContentText
{
    UIView* indexView = [self viewWithTag:1111];
    UILabel* contentLabel = [indexView viewWithTag:102];
    return [self boundingRectWithSize:CGSizeMake(CGRectGetWidth(contentLabel.frame), 0)].height;
}

- (CGSize)boundingRectWithSize:(CGSize)size
{
    UIView* indexView = [self viewWithTag:1111];
    UILabel* contentLabel = [indexView viewWithTag:102];
    UIFont* font = contentLabel.font;
    
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGSize retSize = [self.messageString boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    return retSize;
}
- (IBAction)cannelView:(id)sender {
    [overlayWindow resignKeyWindow];
    overlayWindow.hidden = YES;
    [overlayWindow removeFromSuperview];
}

@end
