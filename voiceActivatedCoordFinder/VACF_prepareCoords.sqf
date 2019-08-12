
_parsed_VACF_Heading	= VACF_Heading joinString "";
_parsed_VACF_Distance 	= VACF_Distance joinString "";

_parsed_VACF_Heading2	= parseNumber _parsed_VACF_Heading;
_parsed_VACF_Distance2	= parseNumber _parsed_VACF_Distance;

[_parsed_VACF_Heading2, _parsed_VACF_Distance2] execVM "voiceActivatedCoordFinder\VACF_execute.sqf";


