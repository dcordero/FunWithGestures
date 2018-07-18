# FunWithGestures 📺👈

Playground project to test gesture recognizers in tvOS

This repo contains an App, with a single UIViewController which detects and logs the following Siri Remote gestures:

* Swipe: up, down, left and right
* Tap: up, down, left and right
* Click: up, down, left, right and center
* Long touch: up, down, left, right and center
* Play/Pause key
* Menu key
 
Some gestures needs to get the absolute position of the finger in the touch area of Siri Remote, to do so, those gesture recognizers use the GameController framework
