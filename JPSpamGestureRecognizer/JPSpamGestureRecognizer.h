//
//  JPSpamGestureRecognizer.h
//
//  Created by Justin Poliachik on 11/30/14.
//  Copyright (c) 2014 justinpoliachik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPSpamGestureRecognizer : UIGestureRecognizer

@property (nonatomic, assign) NSUInteger numberOfTapsPerSecondRequired;
@property (nonatomic, copy) void (^recognizedBlock)();

@end
