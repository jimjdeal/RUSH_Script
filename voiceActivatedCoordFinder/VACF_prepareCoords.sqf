
_parsed_VACF_Heading	= VACF_Heading joinString "";
_parsed_VACF_Distance 	= VACF_Distance joinString "";

_parsed_VACF_Heading	= parseNumber _parsed_VACF_Heading;
_parsed_VACF_Distance	= parseNumber _parsed_VACF_Distance;

// _parsed_VACF_Heading_count = _parsed_VACF_Heading select 0;
// systemChat "shjowing select 0 heading array";
// systemChat str _parsed_VACF_Heading_count;
// sleep 10;
// systemChat "continuing";



[_parsed_VACF_Heading, _parsed_VACF_Distance] execVM "voiceActivatedCoordFinder\VACF_execute.sqf";


