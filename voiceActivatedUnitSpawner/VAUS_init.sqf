/*
from:
to:			voiceActivatedUnitSpawner\initialiseVAUS.sqf

purpose:
basic initialiser, in case I need an additional 'staging' step - probably not and should probs remove this 

notes:
I need to remind myself why VUAS_activeGroups is managed here..?!
*/

// systemChat "vaus_init";
execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";

// record number of HC groups 
VAUS_activeGroups = 0;