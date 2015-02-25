Apportable Gesture Test
=======================

Apportable SDK v1.1.25 introduces a regression in which the `UIGestureRecognizerStateEnded` does not trigger for a `UIPanGestureRecognizer`. This breaks controls such as the `CCScrollView` on Android.

This is a testcase for the Apportable implementation of `UIPanGestureRecognizer`. It includes a `CCScrollView` which uses panning, as well as a vanilla gesture recognizer.

Both test cases are confirmed to be working on Apportable SDK v1.1.24.

This project was built with SpriteBuilder 1.2 and cocos2d 3.2.1.

To reproduce:
-------------

1. Build and load with v1.1.24
2. Notice that the left scroll view background becomes highlighted while dragging and then unhighlighted when dragging ends.
3. Also notice that panning on the right will highlight the screen and output the current state of the pan gesture recognizer.
4. Build and load with v1.1.25
5. Notice the left background becomes highlighed while dragging, but then stays highlighted even when dragging ends because `scrollViewDidEndDragging:willDecelerate:` is never called.
6. Also notice that panning on the right will highlight the screen, but then stays highlighted even when panning ends because `UIGestureRecognizerStateEnded` is never triggered.
