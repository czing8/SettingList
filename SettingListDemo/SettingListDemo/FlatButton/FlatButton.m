//
//  FlatButton.m
//  FlatButton
//
//  Created by Vols on 14-7-18.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "FlatButton.h"

const CGFloat kFlatButtonBoldLineWidth = 3.0;
const CGFloat kFlatButtonNormalLineWidth = 2.0;

@implementation FlatButton
@synthesize bold = _bold;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    //stuff
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 8);
  }
  return self;
}


+ (FlatButton *)button {
  return [FlatButton buttonWithType:UIButtonTypeCustom];
}

- (void)drawRect:(CGRect)rect {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  CGColorRef strokeColor;
  CGColorRef fillColor;
  
  switch (self.state) {
    case UIControlStateHighlighted:
    case UIControlStateSelected:
      strokeColor = [self titleColorForState:UIControlStateNormal] ? [self titleColorForState:UIControlStateNormal].CGColor : [UIColor blackColor].CGColor;
      fillColor = [self titleColorForState:UIControlStateNormal] ? [self titleColorForState:UIControlStateNormal].CGColor : [UIColor blackColor].CGColor;
      break;
    case UIControlStateDisabled:
      strokeColor = [self titleColorForState:UIControlStateDisabled] ? [self titleColorForState:UIControlStateDisabled].CGColor : [UIColor blackColor].CGColor;
      fillColor = [self titleColorForState:UIControlStateDisabled] ? [self titleColorForState:UIControlStateDisabled].CGColor : [UIColor blackColor].CGColor;
  
      break;
    default:
      strokeColor = [self titleColorForState:UIControlStateNormal] ? [self titleColorForState:UIControlStateNormal].CGColor : [UIColor blackColor].CGColor;
      fillColor = [UIColor clearColor].CGColor;
      break;
  }
  
  CGContextSetFillColorWithColor(ctx, fillColor);
  CGContextSetStrokeColorWithColor(ctx, strokeColor);
  
  CGContextSaveGState(ctx);
  
  CGFloat lineWidth = self.bold ? kFlatButtonBoldLineWidth : kFlatButtonNormalLineWidth;
  
  CGContextSetLineWidth(ctx, lineWidth);
  
  UIBezierPath *outlinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, lineWidth, lineWidth) cornerRadius:self.bounds.size.height/2];
  
  CGContextAddPath(ctx, outlinePath.CGPath);
  CGContextStrokePath(ctx);
  
  CGContextRestoreGState(ctx);
  
  if (self.highlighted) {
    CGContextSaveGState(ctx);
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, lineWidth * 2.5, lineWidth * 2.5) cornerRadius:self.bounds.size.height/2];
    
    CGContextAddPath(ctx, fillPath.CGPath);
    CGContextFillPath(ctx);
    
    CGContextRestoreGState(ctx);
  }
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted {
  [super setHighlighted:highlighted];
  [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected {
  [super setSelected:selected];
  [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled {
  [super setEnabled:enabled];
  [self setNeedsDisplay];
}

- (void)setFrame:(CGRect)frame {
  [super setFrame:frame];
  [self setNeedsDisplay];
}

#pragma mark - Setters / Getters
- (void)setBold:(BOOL)bold {
  _bold = bold;
  [self setNeedsDisplay];
}

- (BOOL)bold{
  return _bold;
}

@end
