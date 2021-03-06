//
//  HCRHeaderView.m
//  UNHCR
//
//  Created by Sean Conrad on 10/24/13.
//  Copyright (c) 2013 Sean Conrad. All rights reserved.
//

#import "HCRHeaderView.h"

////////////////////////////////////////////////////////////////////////////////

static const CGFloat kXLabelPadding = 20.0;
static const CGFloat kLabelHeight = 39.0;

static const CGFloat kTitleLabelDefaultFontSize = 15.0;

static const CGFloat kTitleLabelFontSize = 18.0;
static const CGFloat kSubtitleLabelFontSize = 15.0;

static const CGFloat kHeaderHeightDefault = 64.0;
static const CGFloat kHeaderHeightNoText = 34.0;
static const CGFloat kHeaderHeightNoTextSmall = 2.25;

static const CGFloat kBottomLineHeight = 0.5;

////////////////////////////////////////////////////////////////////////////////

@interface HCRHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property UILabel *subtitleLabel;

@property UIView *headerBottomLineView;

@end

////////////////////////////////////////////////////////////////////////////////

@implementation HCRHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor tableBackgroundColor];
        
        // bottom line
        self.headerBottomLineView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.headerBottomLineView];
        
        self.headerBottomLineView.backgroundColor = [UIColor tableDividerColor];
        
        // title label
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:self.titleLabel];
        
        self.titleLabel.textColor = [UIColor tableHeaderTitleColor];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;

        
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.backgroundColor = [UIColor tableBackgroundColor];
    
    if (self.titleString) {
        self.titleString = nil;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(kXLabelPadding,
                                       CGRectGetHeight(self.bounds) - kLabelHeight,
                                       CGRectGetWidth(self.bounds) - 2 * kXLabelPadding,
                                       kLabelHeight);
    
    self.headerBottomLineView.frame = CGRectMake(0,
                                                 CGRectGetHeight(self.bounds) - kBottomLineHeight,
                                                 CGRectGetWidth(self.bounds),
                                                 kBottomLineHeight);
    
}

#pragma mark - Class Methods

+ (CGSize)preferredHeaderSizeForCollectionView:(UICollectionView *)collectionView {
    
    return CGSizeMake(CGRectGetWidth(collectionView.bounds),
                      kHeaderHeightDefault);
    
}

+ (CGSize)preferredHeaderSizeWithoutTitleForCollectionView:(UICollectionView *)collectionView {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds),
                      kHeaderHeightNoText);
}

+ (CGSize)preferredHeaderSizeWithoutTitleSmallForCollectionView:(UICollectionView *)collectionView {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds),
                      kHeaderHeightNoTextSmall);
}

+ (CGSize)preferredHeaderSizeWithLineOnlyForCollectionView:(UICollectionView *)collectionView {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds),
                      kBottomLineHeight);
}

#pragma mark - Getters & Setters

- (void)setTitleString:(NSString *)titleString {
    
    _titleString = titleString;
    
    NSString *newString = titleString;
    
    if (self.titleStyle == HCRHeaderTitleStyleDefault) {
        self.titleLabel.font = [UIFont helveticaNeueFontOfSize:kTitleLabelDefaultFontSize];
        newString = [newString uppercaseString];
    } else {
        self.titleLabel.font = [UIFont helveticaNeueFontOfSize:kTitleLabelFontSize];
    }
    
    self.titleLabel.text = newString;
    
    [self setNeedsLayout];
    
}

@end
