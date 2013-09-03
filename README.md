### A Cowardly Test-o-phobe's Guide To Test-Driven Development With iOS

#### Being the code from a presentation given at iOSDevUK, September 2013

This is the complete code for the Traffic Lights example used as the basis of Tim Duckett's presentation at iOSDevUK, Aberystwyth, 3rd September 2013.

There are four sets of tests:

* _BaseKiwiTest_, which is an empty but functional Kiwi test
* _ModelTests_, which tests the correct functioning of the LightEngine model class
* _LightsTests_, which tests the correct functioning of the UI methods responding to the code returned by the LightEngine class
* _UITests_, which tests the correct functioning of the user interaction aspects of the UI.

#### Prerequistes

1. Xcode 4.5 or later (this example will not function correctly under Xcode 5)
1. [Kiwi](https://github.com/allending/Kiwi)

A Keynote presentation containing the object diagram, state machine flows and the derivation of the lights codes is included in the root of the project.

### Licensing

This project is licensed under Creative Commons Attribution NonCommercial ShareAlike 3.0 Unported terms.  Feel free to use noncommercially as you see fit; if you include it in teaching materials or similar, then a link back to my site [http://adoptioncurve.net](http://adoptioncurve.net) would be appreciated.

Copyright (cc) 2013 Tim Duckett

