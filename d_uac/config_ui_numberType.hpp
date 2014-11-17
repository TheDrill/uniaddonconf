
#include "ui_macros.hpp"


class Addons__d_uac_NumberType_Edit: Addons__d_uac_BaseValueEditDialog
{
	onUnload = "\
			if ((_this select 1) == 2) then\
			{\
				Addons__d_uac_ED__val_type = 0;\
			};\
			if ((_this select 1) == 1) then\
			{\
				Addons__d_uac_ED__val_type = 1;\
				Addons__d_uac_ED__new_val = ctrlText 101;\
			};\
			Addons__d_uac_ED__dialogIsShown = false;\
		";
		
	
	class Controls
	{
		
		class Title: RscTitle
		{
			idc = 501;
//			text = "Addons__d_uac_ED__title";
		
			colorBackground[] = {0,0,0,0};
			style = 0;
						
			x = BED_X;
			y = BED_Y - 1.1 * HEIGHT_BASE_SIZE;
			w = BED_W;
			h = 1 * HEIGHT_BASE_SIZE;
		};
		
		class InputEditBox: RscEdit
		{
			idc = 101;
			
			x = BED_X + 0.5*WIDTH_BASE_SIZE;
			y = BED_Y + 7*HEIGHT_BASE_SIZE;
			w = BED_W - 1*WIDTH_BASE_SIZE;
			h = 1*HEIGHT_BASE_SIZE;
			
//			SizeEx = HEIGHT_BASE_SIZE * 4.5 / 5.0;

			onKeyUp = "\
					if (_this select 1 in [0x1C, 0x9C]) then\
					{\
						closeDialog 1;\
						true;\
					};\
					false;\
				";						

			
			colorBackground[] = {0,0,0,0.7};	
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

	
		
		class Button_Cancel: RscButtonMenu
		{
			idc = 2; 
			text = "$STR_DISP_CANCEL"; 

			x = BED_X;
			y = BED_Y + BED_H + 0.1 * HEIGHT_BASE_SIZE;
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};		

	
		class Button_Ok: RscButtonMenu
		{
			idc = 1; 
			text = "$STR_DISP_OK"; 

		
			x = BED_X + BED_W - 6.25 * WIDTH_BASE_SIZE;
			y = BED_Y + BED_H + 0.1 * HEIGHT_BASE_SIZE;
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		

		class Button_Default: RscButtonMenu
		{
			text = "$STR_Addons__d_uac__ED_DefaultButton"; 
			
			
			action = "\
				Addons__d_uac_ED__val_type = 2;\
				closeDialog 0;\
				";
			
		
			x = BED_X + 6.25 * WIDTH_BASE_SIZE + 0.1 * WIDTH_BASE_SIZE;
			y = BED_Y + BED_H + 0.1 * HEIGHT_BASE_SIZE;
			w = 7.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		
	};
};
