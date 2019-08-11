
_parsed_VACF_Heading	= VACF_Heading joinString "";
_parsed_VACF_Distance 	= VACF_Distance joinString "";

_parsed_VACF_Heading2	= parseNumber _parsed_VACF_Heading;
_parsed_VACF_Distance2	= parseNumber _parsed_VACF_Distance;

// systemChat "debug pause";
// sleep 3;
// systemChat "now in prepareCoords script - test whether local vars are present and correct";
// sleep 3;
// systemChat str _parsed_VACF_Heading2;
// systemChat str _parsed_VACF_Distance2;

[_parsed_VACF_Heading2, _parsed_VACF_Distance2] execVM "voiceActivatedCoordFinder\VACF_execute.sqf";


