03 Sept:
Confirm that functions work when rendering repeated UI VAVS elements
(as I now use functions for repeated code)
PASSED

Test that all 4 marker types work now, after creating staging zones
PASSED

Confirm that the objective-flow works
I have added new keyDowns, monitor logic and new functions in oscarMike
FAILED
PASSED

Confirm that VAHC orders work in both standard move and also primary and secondary objectives
FAILED
PASSED

04 sept:
6 camo UI blocks under the IFV thread have been replaced with functions.
Test: does IFV camo appear and work as before? If yes, successful.
PASSED

Lots of work done on the UI classes for VAVS, now hopefully will complete
all cyctles properly, excluding LSVs, which needs a little more thinking on the camo side of things
PARTIAL PASS - still some tidy work to do

05 sept:
Test that smoke works in VAAS
PASSED

Test that you can allocate objective-based orders to all 5 HC groups
PASSED - PARTIAL - not checked every combo

Test that VAVS enables allocation HC group during spawner creation
PASSED

Known Issues:
HC groups are disappearing after objective orders are given ... find the pattern here
Seems to be linked to staging zone objective?
Also seen HC groups vanish after certain units are spawned


Outstanding Tests:
Test VA instructions are synced with objectives - i.e. test behaviour is correct
Test that units spawn ok after moving the clearKeydowns to the beginning of the block
