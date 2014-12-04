JPSpamGestureRecognizer
=======================

Detects rapid tapping

`UIGestureRecognizer` subclass that watches for repeated taps within 1 second.


![alt tag](https://raw.githubusercontent.com/Jpoliachik/JPSpamGestureRecognizer/master/spamvideogif.gif)

### Installation

##### Cocoapods
`pod JPSpamGestureRecognizer`

  -  Current Version: `0.1`

Or copy `JPSpamGestureRecognizer` header and footer into project.


### Usage

Add the gesture recognizer to any `UIView`

```objective-c
JPSpamGestureRecognizer *spamGesture = [[JPSpamGestureRecognizer alloc] initWithTarget:self action:@selector(onSpam)];
spamGesture.numberOfTapsPerSecondRequired = 4;
spamGesture.recognizedBlock = ^{
     // alternate gesture recognizer block
};

[self.view addGestureRecognizer:spamGesture];
```
