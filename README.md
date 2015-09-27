# PSForceTouchGestureRecognizer

Easy to use Gesture Recognizer for 3D Touch written in Objective-C

## Usage

Initialize a `PSForceTouchGestureRecognizer`, set the minimumForce value and optionally the numberOfTouchesRequired, and add it to a UIView object.
        PSForceTouchGestureRecognizer *recognizer = [[PSForceTouchGestureRecognizer alloc] initWithTarget:self action:@selector(forceTouch:)];
        recognizer.minimumForce = 0.8;
        [self addGestureRecognizer:recognizer];

The `minimumForce` is compared against a normalized force value, 1.0 being the maximum force value and 0.0 being the minimum.

For the gesture to reach the `Ended` state, all touches must be equal to or greater than the `minimumForce` value

## License

 The MIT License (MIT)
 
 Copyright (c) 2015 Paraset LLC
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
