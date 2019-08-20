
/*
    This layout schema is a 4-column list with heading and footer 
*/


/*
contains render info for:
main heading 
3 sub columns
3 category lists
confirm / cancel 
thank you
*/


class RscTitles {

    class Default {
       idd                          = -1;
       fadein                       = 0;
       fadeout                      = 0;
       duration                     = 0;
    };

    class VAUS_MAINTITLE {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_MAINTITLE";
		onLoad                      = "with uiNameSpace do { VAUS_MAINTITLE = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10000;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.600 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "4";
				}; 
            };
		};
	};

    class VAUS_SUBTITLE_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_SUBTITLE_n1";
		onLoad                      = "with uiNameSpace do { VAUS_SUBTITLE_n1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.200 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_SUBTITLE_n2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_SUBTITLE_n2";
		onLoad                      = "with uiNameSpace do { VAUS_SUBTITLE_n2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10002;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.200 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_SUBTITLE_n3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_SUBTITLE_n3";
		onLoad                      = "with uiNameSpace do { VAUS_SUBTITLE_n3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10003;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.200 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// content 

    class VAUS_CONTENT_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONTENT_n1";
		onLoad                      = "with uiNameSpace do { VAUS_CONTENT_n1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10004;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.250 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.350 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_CONTENT_n2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONTENT_n2";
		onLoad                      = "with uiNameSpace do { VAUS_CONTENT_n2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10005;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.250 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.350 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_CONTENT_n3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONTENT_n3";
		onLoad                      = "with uiNameSpace do { VAUS_CONTENT_n3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10006;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.250 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.350 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// confirm or clear 

    class VAUS_CONFIRMCANCEL {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONFIRMCANCEL";
		onLoad                      = "with uiNameSpace do { VAUS_CONFIRMCANCEL = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10007;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.600 * safezoneH + safezoneY;
				w                   = 0.800 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// confirm message 

    class VAUS_THANKS {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_THANKS";
		onLoad                      = "with uiNameSpace do { VAUS_THANKS = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10008;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.300 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.100 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "5";
				}; 
            };
		};
	};

};