JPSpamGestureRecognizer
=======================

Don't let users spam your app with taps!

`UIGestureRecognizer` subclass that watches for repeated taps within 1 second. 

##### Usage

Add the gesture recognizer to any `UIView`

```objective-c
JPSpamGestureRecognizer *spamGesture = [[JPSpamGestureRecognizer alloc] initWithTarget:self action:@selector(onSpam)];
spamGesture.numberOfTapsPerSecondRequired = 4;
spamGesture.recognizedBlock = ^{
     // alternate gesture recognizer block
};
    
[self.view addGestureRecognizer:spamGesture];
```

