
#include "ui_macros.hpp"




class RscText;	
class RscTitle;
class RscListBox;
class RscListNBox;
class RscButtonMenu;
class RscStructuredText;
class RscEdit;


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


class Addons__d_uac_InterruptMenuButton: RscButtonMenu
{
	idc = 6531;
	
	text = "$STR_Addons__d_uac__MainDialogButton";
	tooltip = "$STR_Addons__d_uac__MainDialogButtonTooltip";
	
	action = "(findDisplay 49) closeDisplay 0; [] call d_uac_fnc_ShowConfigDialog;";

	
	x = 1 * WIDTH_BASE_SIZE + safezoneX;
//	y = 1.0 * HEIGHT_BASE_SIZE + safezoneY;
	w = 15 * WIDTH_BASE_SIZE;
	h = 1.0 * HEIGHT_BASE_SIZE;

	y = "[] call {\
		uiNamespace setVariable ['Addons__d_uac_InterruptDialogIsShown', true];\
		[] spawn {waitUntil{ \
			if (uiNamespace getVariable ['Addons__d_uac_InterruptDialogIsShown', false]) then\
			{\
				_pos = ctrlPosition ((findDisplay 49) displayCtrl 523);\
				((findDisplay 49) displayCtrl 6531) ctrlSetPosition [\
					_pos select 0,\
					(_pos select 1) - ( (((safezoneW / safezoneH) min 1.2) / 1.2) / 25 ) * 2.2];\
				((findDisplay 49) displayCtrl 6531)ctrlCommit 0;\
				false;\
			}else{\
				true;\
			};\
		};};\
	0.001}";
	
	onDestroy = "uiNamespace setVariable ['Addons__d_uac_InterruptDialogIsShown', false];";
};

class RscStandardDisplay;
class RscDisplayInterrupt: RscStandardDisplay // idd 49 
{
	class controls
	{
		class Button_d_uac: Addons__d_uac_InterruptMenuButton{};
	};	
};

class RscDisplayMPInterrupt: RscStandardDisplay
{
	class controls
	{
		class Button_d_uac: Addons__d_uac_InterruptMenuButton{};
	};	
};

class RscDisplayInterruptEditor3D: RscStandardDisplay 
{
	class controls
	{
		class Button_d_uac: Addons__d_uac_InterruptMenuButton{};
	};	
};

class RscDisplayInterruptEditorPreview: RscStandardDisplay
{
	class controls
	{
		class Button_d_uac: Addons__d_uac_InterruptMenuButton{};
	};	
};


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////





class Addons__d_uac_ConfigDialog
{
	idd = -1;
	enableDisplay = 1;
	movingEnable = 0;
	enableSimulation = 0;
	
	OnUnload = "_this call d_uac_fnc__OnDialogClosed";

	
	
	
	class ControlsBackground
	{
		class MainBackground:RscText
		{
			x = 1 * WIDTH_BASE_SIZE + (safezoneX);
			y = 2.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 38 * WIDTH_BASE_SIZE;
			h = 20.8 * HEIGHT_BASE_SIZE;
			colorBackground[] = {0,0,0,0.7};

		};

		class List1Background:RscText // sections
		{
			x = 1.5 * WIDTH_BASE_SIZE + (safezoneX);
			y = 3.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 8 * WIDTH_BASE_SIZE;
			h = 19.3 * HEIGHT_BASE_SIZE;		
	
			colorBackground[] = {0,0,0,0.7};

		};

		class List2Background:RscText // entries
		{
			x = 10 * WIDTH_BASE_SIZE + (safezoneX);
			y = 3.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 28.5 * WIDTH_BASE_SIZE;
			h = 19.3 * HEIGHT_BASE_SIZE;		
			colorBackground[] = {0,0,0,0.7};

		};			
	
		class TitleBackground:RscText
		{
			x = 1 * WIDTH_BASE_SIZE + (safezoneX);
			y = 1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 38 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
		};
	};





	class Controls
	{
	
		class Title: RscTitle
		{
			text = "$STR_Addons__d_uac__MainDialogTitle";
		
			colorBackground[] = {0,0,0,0};
			style = 0;
			

			
			x = 1 * WIDTH_BASE_SIZE + (safezoneX);
			y = 1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 38 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;
		};

	
		class SectionsListBoxTitle: RscText
		{
			text = "$STR_Addons__d_uac__SectionsListBoxTitle";
			
			x = 3.5 * WIDTH_BASE_SIZE + (safezoneX);
			y = 2.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 8 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;
			

		};

		class ParametersListBoxTitle: RscText
		{
			text = "$STR_Addons__d_uac__ParametersListBoxTitle";
			
			x = 12 * WIDTH_BASE_SIZE + (safezoneX);
			y = 2.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 8 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;
			

		};

		class ValuesListBoxTitle: RscText
		{
			text = "$STR_Addons__d_uac__ValuesListBoxTitle";
			
			x = 27.105 * WIDTH_BASE_SIZE + (safezoneX);
			y = 2.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 8 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;
			

		};
		
		class SectionsListBox: RscListNBox
		{
			idc = 534001;
			
			default = 1; 
			
			columns[] = {-0.01};
		
			x = 1.5 * WIDTH_BASE_SIZE + (safezoneX);
			y = 3.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 8 * WIDTH_BASE_SIZE;
			h = 19.3 * HEIGHT_BASE_SIZE;		
			
			SizeEx = HEIGHT_BASE_SIZE * 3 / 4;
			
			colorBackground[] = {0,0,0,0.7};
			
			onLBSelChanged = "[] call d_uac_fnc__showEntriesInSection; lnbSetCurSelRow [101, -1];";
		};
				
		class EntriesListBox: RscListNBox
		{
			idc = 534002;
			
			columns[] = {-0.01, 0.53};
		
			x = 10 * WIDTH_BASE_SIZE + (safezoneX);
			y = 3.1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 28.5 * WIDTH_BASE_SIZE;
			h = 19.3 * HEIGHT_BASE_SIZE;	
			
			SizeEx = HEIGHT_BASE_SIZE * 4.5 / 5.0;
			
			colorBackground[] = {0,0,0,0.7};	
			
			onKeyUp = "\
					if (_this select 1 in [0x1C, 0x9C]) then\
					{\
						[] call d_uac_fnc__OnEntryClicked;\
						true;\
					};\
					false;\
				";
			onMouseButtonUp = "_this call d_uac_fnc__OnEntryClicked; false;";
		};
		



		class Button_OK: RscButtonMenu
		{
			idc = 1; 
//			shortcuts[] = {"0x00050000 + 0", 28, 57, 156}; 
			
			text = "$STR_DISP_OK"; 
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1}; 

		
			x = 32.75 * WIDTH_BASE_SIZE + (safezoneX);
			y = 23 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		
		class Button_Cancel: RscButtonMenu
		{
			idc = 2; 
			shortcuts[] = {"0x00050000 + 1"}; 
			text = "$STR_DISP_CANCEL"; 

			x = 1 * WIDTH_BASE_SIZE + (safezoneX);
			y = 23 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};

		class Button_ResetSection: RscButtonMenu
		{
			text = "$STR_Addons__d_uac__DefaultsSectionButton"; 
			
			action = "[true] call d_uac_fnc__Defaults;";

			x = 14.7 * WIDTH_BASE_SIZE + (safezoneX);
			y = 23 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 11.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		
		class Button_ResetAll: RscButtonMenu
		{
			text = "$STR_Addons__d_uac__DefaultsButton"; 
			
			action = "[false] call d_uac_fnc__Defaults;";

			x = 7.35 * WIDTH_BASE_SIZE + (safezoneX);
			y = 23 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 7.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};		
	};
};





class Addons__d_uac_BaseValueEditDialog
{
	idd = -1;
	enableDisplay = 1;
	movingEnable = 0;
	enableSimulation = 0;
	
	onLoad = "uiNamespace setVariable ['Addons__d_uac_ValueEditDialog_Display', _this select 0]";

	class ControlsBackground
	{
		class MainBackground:RscText
		{
			x = BED_X;
			y = BED_Y;
			w = BED_W;
			h = BED_H;
			colorBackground[] = {0,0,0,0.7};

		};

		class TitleBackground:RscText
		{
			x = BED_X;
			y = BED_Y - 1.1 * HEIGHT_BASE_SIZE;
			w = BED_W;
			h = 1 * HEIGHT_BASE_SIZE;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
		};
	};


/*
	class Controls
	{
	
		class Title: RscTitle
		{
			text = "Change value";
		
			colorBackground[] = {0,0,0,0};
			style = 0;
						
			x = 13 * WIDTH_BASE_SIZE + (safezoneX);
			y = 1 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 24 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;
		};
		
		
		class Button_OK: RscButtonMenu
		{
			text = "$STR_DISP_OK"; 
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1}; 

		
			x = 29.75 * WIDTH_BASE_SIZE + (safezoneX);
			y = 15 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};
		
		class Button_Cancel: RscButtonMenu
		{
			text = "$STR_DISP_CANCEL"; 

			x = 14 * WIDTH_BASE_SIZE + (safezoneX);
			y = 15 * HEIGHT_BASE_SIZE + (safezoneY + safezoneH - HEIGHT_BASE_SIZE_2);
			w = 6.25 * WIDTH_BASE_SIZE;
			h = 1 * HEIGHT_BASE_SIZE;	
		};		
	};
*/
};






#include "config_ui_KET.hpp"
#include "config_ui_enumType.hpp"
#include "config_ui_numberType.hpp"
#include "config_ui_stringType.hpp"

