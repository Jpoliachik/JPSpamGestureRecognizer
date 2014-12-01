//
//  JPSpamGestureRecognizer.m
//  flood
//
//  Created by Justin Poliachik on 11/30/14.
//  Copyright (c) 2014 justinpoliachik. All rights reserved.
//

#import <UIKit/UIGestureRecognizerSubclass.h>
#import "JPSpamGestureRecognizer.h"

@interface JPSpamGestureRecognizer()

@property (nonatomic, assign) NSUInteger tapCount;
@property (nonatomic, assign) double previousTime;
@end

@implementation JPSpamGestureRecognizer

- (NSUInteger)numberOfTapsPerSecondRequired
{
    if (!_numberOfTapsPerSecondRequired) {
        _numberOfTapsPerSecondRequired = 4;
    }
    return _numberOfTapsPerSecondRequired;
}

- (double)minimumTimeBetweenTaps
{
    return 1.0 / (double) self.numberOfTapsPerSecondRequired;
}

- (void)reset
{
    [super reset];
    
    self.tapCount = 0;
    self.state = UIGestureRecognizerStatePossible;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent: event];
    
    // get CoreAnimation absolute time because it is quicker than NSDate
    double currentTime = CACurrentMediaTime();
    
    if (self.previousTime) {
        
        // compares the current tap time to the previous one
        // if the two happened in quick enough succession, we increment the tap count
        // when the tap count reaches the required number (minus one, since we are actually counting the number of taps after the first one)
        // the gesture is recognized.
        // if any tap did not happen quick enough after the previous,
        // the recognizer fails and count starts over.

        double elapsed = currentTime - self.previousTime;
        if (elapsed <= [self minimumTimeBetweenTaps]) {
            
            self.tapCount++;
            if (self.tapCount >= self.numberOfTapsPerSecondRequired - 1) {
                // recognized
                self.state = UIGestureRecognizerStateRecognized;
                
                if (self.recognizedBlock) {
                    self.recognizedBlock();
                }
            }
        } else {
            self.tapCount = 0;
            self.state = UIGestureRecognizerStateFailed;
        }
    }

    self.previousTime = currentTime;
    
}

@end
