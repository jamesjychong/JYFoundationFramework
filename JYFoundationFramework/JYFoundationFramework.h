//
//  JYFoundationFramework.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for JYFoundationFramework.
FOUNDATION_EXPORT double JYFoundationFrameworkVersionNumber;

//! Project version string for JYFoundationFramework.
FOUNDATION_EXPORT const unsigned char JYFoundationFrameworkVersionString[];


#import <JYFoundationFramework/JYFoundationConstant.h>

///////////////////
// Foundation

// Collection Category
#import <JYFoundationFramework/NSArray+DataOperation.h>
#import <JYFoundationFramework/NSDictionary+DataOperation.h>
#import <JYFoundationFramework/NSSet+DataOperation.h>
#import <JYFoundationFramework/NSMutableArray+DataOperation.h>
#import <JYFoundationFramework/NSMutableArray+InitialContent.h>
#import <JYFoundationFramework/NSMutableDictionary+DataOperation.h>
#import <JYFoundationFramework/NSMutableSet+DataOperation.h>

// String Category
#import <JYFoundationFramework/NSString+Character.h>
#import <JYFoundationFramework/NSString+Format.h>
#import <JYFoundationFramework/NSString+KeyPath.h>
#import <JYFoundationFramework/NSString+Number.h>
#import <JYFoundationFramework/NSString+UUID.h>

// Calendar Category
#import <JYFoundationFramework/NSCalendar+CalendarUnit.h>

// Date Category
#import <JYFoundationFramework/NSDate+Components.h>
#import <JYFoundationFramework/NSDate+Random.h>
#import <JYFoundationFramework/NSDate+TimeZone.h>
#import <JYFoundationFramework/NSDateFormatter+Cached.h>

// ETC Category
#import <JYFoundationFramework/NSIndexPath+Range.h>
#import <JYFoundationFramework/NSNotificationCenter+MainThread.h>



///////////////////
// User Interface

// UIColor
#import <JYFoundationFramework/UIColor+Initializer.h>
#import <JYFoundationFramework/UIColor+JYUtil.h>
#import <JYFoundationFramework/UIColor+Random.h>

// UIView Category
#import <JYFoundationFramework/UIView+Animation.h>
#import <JYFoundationFramework/UIView+AutoLayout.h>
#import <JYFoundationFramework/UIView+Border.h>
#import <JYFoundationFramework/UIView+Draw.h>
#import <JYFoundationFramework/UIView+RoundedCorner.h>
#import <JYFoundationFramework/UIView+Subview.h>

// UIView Subview
#import <JYFoundationFramework/JYUtilTapDetectingImageView.h>
#import <JYFoundationFramework/JYUtilTapDetectingView.h>

// UIBarButtonItem Category
#import <JYfoundationFramework/UIBarButtonItem+PlainItem.h>
#import <JYFoundationFramework/UIBarButtonItem+SystemItem.h>

// ETC Category
#import <JYFoundationFramework/UILabel+Font.h>
#import <JYFoundationFramework/UINavigationController+ViewController.h>
