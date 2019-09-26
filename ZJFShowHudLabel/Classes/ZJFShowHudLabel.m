//
//  ShowHudLabel.m
//  yonbb
//
//  Created by sth on 2017/7/20.
//  Copyright © 2017年 Yonbb. All rights reserved.
//

#import "ZJFShowHudLabel.h"
//#import "UIView+Extension.h"

//是否为iphoneX机型
#define IsIphoneX ([[UIApplication sharedApplication] statusBarFrame].size.height>20?YES:NO)
//视图离屏幕底部的安全区域（iphoneX中为34）
#define BottomSafeHeight ((IsIphoneX)?(34.0f):(0.0f))
#define Uwidth        [[UIScreen mainScreen] bounds].size.width
#define UScreenHeight [[UIScreen mainScreen] bounds].size.height
#define Uheight       (UScreenHeight-BottomSafeHeight)
#define KScreen       Uwidth/320
#define NavibarHeight ((IsIphoneX)?(88.0f):(64.0f))

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGPoint)origin
{
    return self.frame.origin;
}

-(CGFloat) originX
{
    return self.frame.origin.x;
}

-(void) setOriginX:(CGFloat)originX
{
    self.frame = CGRectMake(originX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

-(CGFloat)originY
{
    return self.frame.origin.y;
}

-(void)setOriginY:(CGFloat)originY
{
    self.frame = CGRectMake(self.frame.origin.x, originY, self.frame.size.width, self.frame.size.height);
}

-(CGFloat)frameRight
{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setFrameRight:(CGFloat)newRight
{
    self.frame = CGRectMake(newRight - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

-(CGFloat)frameBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setFrameBottom:(CGFloat)newBottom
{
    self.frame = CGRectMake(self.frame.origin.x, newBottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

-(CGFloat)frameWidth
{
    return self.frame.size.width;
}

-(void)setFrameWidth:(CGFloat)newWidth
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newWidth, self.frame.size.height);
}

-(CGFloat)frameHeight
{
    return self.frame.size.height;
}

-(void)setFrameHeight:(CGFloat)newHeight
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newHeight);
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

@end


static NSString *remarkTime = @"";

@interface ZJFShowHudLabel ()

@end

@implementation ZJFShowHudLabel
{
    CGFloat _duration;
    BOOL _IsAnimation;
}

static ZJFShowHudLabel *_hud;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _hud = [super allocWithZone:zone];
    });
    return _hud;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return _hud;
}

- (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _hud;
}

+ (instancetype)shareHud
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_hud == nil) {
            _hud = [[[self class] alloc] init];
            
        }
    });
    return _hud;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.numberOfLines = 0;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.font = [UIFont systemFontOfSize:13*KScreen];
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:0.8];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)showInfo:(NSString *)showText WithTopY:(CGFloat)topY OnDuration:(CGFloat)duration
{
    if (([[NSString stringWithFormat:@"%ld",time(NULL)] integerValue] - [remarkTime integerValue] > duration+0.3) && _IsAnimation == NO) {
        
        if (showText != nil && showText.length>0) {
            _IsAnimation = YES;
            _duration = duration;
            self.text = showText;
            // 根据文本内容获取真实size
            CGSize realSize = [self sizeThatFits:CGSizeMake(Uwidth-60, 10000000.0f)];
            self.width = fmin(realSize.width+30, Uwidth-60);
            if (topY == 0) {
                //如果是默认0
                self.x = Uwidth/2 - self.width/2;
                self.height = [self getSpaceLabelHeight:showText withWidh:self.width withFont:[UIFont systemFontOfSize:14*KScreen]]+7*KScreen;
                self.y = UScreenHeight-self.height-0.2*UScreenHeight;//0.75*UScreenHeight;
            }else{
                //y的距离由传进来的值控制
                self.y = topY;
                self.x = Uwidth/2 - self.width/2;
                self.height = [self getSpaceLabelHeight:showText withWidh:self.width withFont:[UIFont systemFontOfSize:14*KScreen]]+7*KScreen;
            }
            //显示
            [self showView];
            //隐藏
            [self hideView];
            remarkTime = [NSString stringWithFormat:@"%ld",time(NULL)];
        }else{
            return ;
        }
    }
    
}

-(CGFloat)getSpaceLabelHeight:(NSString *)str withWidh:(CGFloat)width withFont:(UIFont *)textFont
{
    NSMutableParagraphStyle *paragphStyle=[[NSMutableParagraphStyle alloc]init];
    paragphStyle.lineSpacing=0;//设置行距为0
    paragphStyle.firstLineHeadIndent=0.0;
    paragphStyle.hyphenationFactor=0.0;
    paragphStyle.paragraphSpacingBefore=0.0;
    NSDictionary *dic=@{NSFontAttributeName:textFont, NSParagraphStyleAttributeName:paragphStyle, NSKernAttributeName:@1.0f};
    CGSize size=[str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


- (void)showView
{
    UIWindow *view = [[[UIApplication sharedApplication] delegate] window];
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (id windowView in windows) {
        NSString *viewName = NSStringFromClass([windowView class]);
        if ([@"UIRemoteKeyboardWindow" isEqualToString:viewName]) {
            view = windowView;
            break;
        }
    }
    //添加到最底层的window上
//    UIWindow *lastWindow = [NSObject lastWindow];
    [view addSubview:self];
    //开启动画效果
    self.alpha = 1.0;
    self.hidden = NO;
//    [UIView animateWithDuration:0.2 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
//        self.alpha = 1.0;
//        self.hidden = NO;
//    } completion:^(BOOL finished) {
//        [self.layer viewBeginZoomWithDuration:0.3];
//
//    }];
}

- (void)hideView
{
    //时间到期，隐藏
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //开启动画效果
        [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
//            self.y -= 20*KScreen;
            self.alpha = 0.0f;
        } completion:^(BOOL finished) {
            self.hidden = YES;
            _IsAnimation = NO;
        }];
    });
}


@end

