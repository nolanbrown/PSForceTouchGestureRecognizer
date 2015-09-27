//
//  PSForceTouchGestureRecognizer.h
//  Copyright © 2015 Paraset LLC. All rights reserved.
//

#import "PSForceTouchGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface PSForceTouchGestureRecognizer ()

@property (nonatomic, readwrite) CGFloat currentForce;

@end

@implementation PSForceTouchGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)action {
    
    if (self = [super initWithTarget:target action:action]) {

        self.numberOfTouchesRequired = 1.0;
        self.minimumForce = 0.0;
    }
    
    return self;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (touches.count != self.numberOfTouchesRequired) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    [super touchesBegan:touches withEvent:event];

    [super setState:UIGestureRecognizerStateBegan];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    CGFloat currentMinimumForce = 1.0;
    BOOL actionable = YES;
    for(UITouch *t in touches) {
        CGFloat force = t.force;
        CGFloat maxForce = t.maximumPossibleForce;
        CGFloat normalizedForce = (force / maxForce);
        if(normalizedForce < currentMinimumForce) {
            currentMinimumForce = normalizedForce;
        }
        if(normalizedForce < self.minimumForce) {
            actionable = NO;
        }
    }
    
    self.currentForce = currentMinimumForce;
    
    [super setState:UIGestureRecognizerStateChanged];

    if(actionable) {
        [super setState:UIGestureRecognizerStateEnded];
    }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [super setState:UIGestureRecognizerStateCancelled];
}

- (void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [super setState:UIGestureRecognizerStateCancelled];

}

@end
