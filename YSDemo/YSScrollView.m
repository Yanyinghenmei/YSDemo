//
//  YSScrollView.m
//  YSDemo
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 luantianshu. All rights reserved.
//

#import "YSScrollView.h"

@implementation YSScrollView{
    UIScrollView *scrollview;
    CGFloat scrollViewWidth;
}

- (instancetype)initWithFrame:(CGRect)frame pageWidth:(CGFloat)pageWidth {
    if (self = [super initWithFrame:frame]) {
        
        scrollViewWidth = pageWidth;
        
        scrollview = ({
            UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, frame.size.height)];
            scroll.pagingEnabled = YES;
            scroll.clipsToBounds = NO;
            scroll;
        });
        [self addSubview:scrollview];
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)loadImages:(NSArray *)array{
    int index = 0;
    [scrollview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for(NSString * name in array){
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(index *scrollViewWidth, 0, scrollViewWidth, self.frame.size.height)];
        iv.image = [UIImage imageNamed:name];
        iv.contentMode = UIViewContentModeScaleToFill;
        CGRect fra = iv.frame;
        fra.size.width = scrollViewWidth;
        fra.origin.x = index * scrollViewWidth;
        iv.frame = fra;
        [scrollview addSubview:iv];
        index++;
    }
    
    scrollview.contentSize = CGSizeMake(scrollview.frame.size.width*index, scrollview.frame.size.height);
}

// 点击穿透
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event  {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self])  {
        for (UIView *subview in scrollview.subviews) {
            CGPoint offset = CGPointMake(point.x - scrollview.frame.origin.x + scrollview.contentOffset.x - subview.frame.origin.x,point.y - scrollview.frame.origin.y + scrollview.contentOffset.y - subview.frame.origin.y);
            if ((view = [subview hitTest:offset withEvent:event])) {
                return view;
            }
        }
        return scrollview;
    }
    return view;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
