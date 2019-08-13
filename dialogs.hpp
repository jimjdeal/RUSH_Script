class RscTitles {

    class Default {
       idd                          = -1;
       fadein                       = 0;
       fadeout                      = 0;
       duration                     = 0;
    };

    class VACF {
        idd                         = 1000000;
        movingEnable                =  0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    =  99999;
        fadein                      =  0.1;
        fadeout                     =  2;
        name                        = "VACF";
		onLoad                      = "with uiNameSpace do { VACF = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 1001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.950 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
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
};