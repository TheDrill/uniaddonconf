
#include "ui_macros.hpp"


class Addons__d_uac_KeyType_Edit: Addons__d_uac_BaseValueEditDialog
{
	onUnload = "\
			if ((_this select 1) == 2) then\
			{\
				Addons__d_uac_KET__val = [];\
			};\
			if ((_this select 1) == 1) then\
			{\
				Addons__d_uac_KET__val = [0,false,false,false];\
			};\
			Addons__d_uac_KET__dialogIsShown = false;\
		";
	
	onKeyUp = "\
			if ((_this select 1) in [1]) then\
			{\
				false;\
			}\
			else\
			{\
				Addons__d_uac_KET__val = [_this select 1, _this select 2,\
					_this select 3, _this select 4];\
				closeDialog 0;\
				true;\
			};\
		";

//				Addons__d_uac_KET__val = [_this select 1,\
//					if ((_this select 1) in [0x2A, 0x36]) then {false} else {_this select 2},\
//					if ((_this select 1) in [0x1D, 0x9D]) then {false} else {_this select 3},\
//					if ((_this select 1) in [0x38, 0xB8]) then {false} else {_this select 4}];\
	
	onKeyDown = "\
			if ((_this select 1) in [1]) then\
			{\
				false;\
			}\
			else\
			{\
				if ((_this select 1) in [0x2A, 0x36, 0x1D, 0x9D, 0x38, 0xB8]) then\
				{\
					true;\
				}\
				else\
				{\
					Addons__d_uac_KET__val = [_this select 1, _this select 2,\
						_this select 3, _this select 4];\
					closeDialog 0;\
					true;\
				};\
			};\
		";
		
	
	class Controls
	{
		
		class Title: RscTitle
		{
			idc = 501;
			text = "";
		
			colorBackground[] = {0,0,0,0};
			style = 0;
						
			x = BED_X;
			y = BED_Y - 1.1 * HEIGHT_BASE_SIZE;
			w = BED_W;
			h = 1 * HEIGHT_BASE_SIZE;
		};
	
	
		class Description: RscStructuredText
		{
			text = "$STR_Addons__d_uac__KET_DialogText";
		
			colorBackground[] = {0,0,0,0};
			style = 0;
						
			x = BED_X + 0.5*WIDTH_BASE_SIZE;
			y = BED_Y + 0.5*HEIGHT_BASE_SIZE;
			w = BED_W - 1*WIDTH_BASE_SIZE;
			h = BED_H - 0.5*HEIGHT_BASE_SIZE;
		};

		class CurrentValue: RscText
		{
			idc = 502;
//			text = "(localize 'STR_Addons__d_uac__ED_CurrentValue') + Addons__d_uac_ED__cur_val";
		
			colorBackground[] = {0,0,0,0};
			
			x = BED_X + 0.5*WIDTH_BASE_SIZE;
			y = BED_Y + 13.5*HEIGHT_BASE_SIZE;
			w = BED_W - 1*WIDTH_BASE_SIZE;
			h = 1*HEIGHT_BASE_SIZE;
		};

		class DefaultValue: RscText
		{
			idc = 503;
//			text = "(localize 'STR_Addons__d_uac__ED_DefaultValue') + Addons__d_uac_ED__def_val";
		
			colorBackground[] = {0,0,0,0};
						
			x = BED_X + 0.5*WIDTH_BASE_SIZE;
			y = BED_Y + 14.5*HEIGHT_BASE_SIZE;
			w = BED_W - 1*WIDTH_BASE_SIZE;
			h = 1*HEIGHT_BASE_SIZE;
		};

	
		class Button_None: RscButtonMenu
		{
			idc = 1; 
			text = "$STR_Addons__d_uac__KET_NoneButton"; 
			
			

		
			x = BED_X + BED_W - 6.25 * WIDTH_BASE_SIZE;
			y = BED_Y + BED_H + 0.1 * HEIGHT_BASE_SIZE;
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		
		class Button_Cancel: RscButtonMenu
		{
			idc = 2; 
			text = "$STR_DISP_CANCEL"; 

			x = BED_X;
			y = BED_Y + BED_H + 0.1 * HEIGHT_BASE_SIZE;
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};		


		class Button_Default: RscButtonMenu
		{
			text = "$STR_Addons__d_uac__KET_DefaultButton"; 
			
			
			onMouseButtonUp = "\
				Addons__d_uac_KET__val = [-1,false,false,false];\
				closeDialog 0;\
				";
			
		
			x = BED_X + 6.25 * WIDTH_BASE_SIZE + 0.1 * WIDTH_BASE_SIZE;
			y = BED_Y + BED_H + 0.1 * HEIGHT_BASE_SIZE;
			w = 7.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		
	};
};
