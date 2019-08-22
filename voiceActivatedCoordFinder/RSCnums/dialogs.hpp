
class RscTitles {

    class Default {
       idd                          = -1;
       fadein                       = 0;
       fadeout                      = 0;
       duration                     = 0;
    };

    class VACF {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
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

    class VACF_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VACF_n1";
		onLoad                      = "with uiNameSpace do { VACF_n1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 9900;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
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

     class VACF_h1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VACF_h1";
		onLoad                      = "with uiNameSpace do { VACF_h1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 9901;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
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

// copy from VAUS hpp
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

// experimental
// based on a lower third concept
// with is one third of the screen, centered 
// meaning one full line = 
/*


0 0 1 1 1 1 1 1 0 0 - full title 6 wide / title 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / sub titles 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 1 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 2 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 3 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 4 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 5 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 6 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 7 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 7 


0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 1 1 1 1 0 - full title 8 wide
0 1 1/1 1/1 1/1 1 0 - 4 columns 2 wide


1111111111
111111111111111111111111111111 1111111111 1111111111 1111111111 1111111111 111111111111111111111111111111
111111111111111111111111111111 0000000000000000000000000000000000000000 111111111111111111111111111111      w30 l40
111111111111111111111111111111 0000000000 00000000000000000000 0000000000 111111111111111111111111111111   w30 l10 / w40 l10/ w50 l10 / w60 l10 
111111111111111111111111111111 0000000000 00000 00000 00000 00000 0000000000 111111111111111111111111111111 w30 l10 / w40 l5 / w45 l5 / w50 l5 / w55 l5 / w60 l10
111111111111111111111111111111 0000000000 00000 00000 00000 00000 0000000000 111111111111111111111111111111 w30 l10 / w40 l5 / w45 l5 / w50 l5 / w55 l5 / w60 l10
111111111111111111111111111111 0000000000000000000000000000000000000000 111111111111111111111111111111      w30 l40

18 blocks

Name: block18
Code: B18
B18_L1_1
B18_L2_1 B18_L2_2 B18_L2_3 B18_L2_4
B18_L3_1 B18_L3_2 B18_L3_3 B18_L3_4 B18_L3_5 B18_L3_6
B18_L4_1 B18_L4_2 B18_L4_3 B18_L4_4 B18_L4_5 B18_L4_6
B18_L5_1


// -----------------------------
B18_L1_1 x30 y60 l40 h05 

B18_L2_1 x30 y65 l10 h05 
B18_L2_2 x40 y65 l20 h05
B18_L2_3 x60 y65 l10 h05

B18_L3_1 x30 y70 l10 h05
B18_L3_2 x40 y70 l05 h05
B18_L3_3 x45 y70 l05 h05 
B18_L3_4 x50 y70 l05 h05
B18_L3_5 x55 y70 l05 h05
B18_L3_6 x60 y70 l10 h05

B18_L4_1 x30 y75 l10 h05
B18_L4_2 x40 y75 l05 h05
B18_L4_3 x45 y75 l05 h05
B18_L4_4 x50 y75 l05 h05
B18_L4_5 x55 y75 l05 h05
B18_L4_6 x60 y75 l10 h05 

B18_L5_1 x30 y80 l20 h05 
B18_L5_2 x50 y80 l20 h05
// -----------------------------
*/


    class B18_L1_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L1_1";
		onLoad                      = "with uiNameSpace do { B18_L1_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.600 * safezoneH + safezoneY;
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
						size        = "2";
				}; 
            };
		};
	};

    class B18_L2_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L2_1";
		onLoad                      = "with uiNameSpace do { B18_L2_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18002;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
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

    class B18_L2_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L2_2";
		onLoad                      = "with uiNameSpace do { B18_L2_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18003;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
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

    class B18_L2_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L2_3";
		onLoad                      = "with uiNameSpace do { B18_L2_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18004;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
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

    class B18_L3_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L3_1";
		onLoad                      = "with uiNameSpace do { B18_L3_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18005;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
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

    class B18_L3_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L3_2";
		onLoad                      = "with uiNameSpace do { B18_L3_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18006;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L3_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L3_3";
		onLoad                      = "with uiNameSpace do { B18_L3_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18007;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.450 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L3_4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L3_4";
		onLoad                      = "with uiNameSpace do { B18_L3_4 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18008;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L3_5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L3_5";
		onLoad                      = "with uiNameSpace do { B18_L3_5 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18009;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.550 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L3_6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L3_6";
		onLoad                      = "with uiNameSpace do { B18_L3_6 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18010;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
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

    class B18_L4_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L4_1";
		onLoad                      = "with uiNameSpace do { B18_L4_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18011;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
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

    class B18_L4_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L4_2";
		onLoad                      = "with uiNameSpace do { B18_L4_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18012;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L4_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L4_3";
		onLoad                      = "with uiNameSpace do { B18_L4_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18013;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.450 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L4_4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L4_4";
		onLoad                      = "with uiNameSpace do { B18_L4_4 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18014;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L4_5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L4_5";
		onLoad                      = "with uiNameSpace do { B18_L4_5 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18015;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.550 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
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

    class B18_L4_6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L4_6";
		onLoad                      = "with uiNameSpace do { B18_L4_6 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18016;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
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

    class B18_L5_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L5_1";
		onLoad                      = "with uiNameSpace do { B18_L5_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18017;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.800 * safezoneH + safezoneY;
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

    class B18_L5_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_L5_2";
		onLoad                      = "with uiNameSpace do { B18_L5_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18018;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.800 * safezoneH + safezoneY;
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

};