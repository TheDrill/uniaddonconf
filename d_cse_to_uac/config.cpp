#define RECOMPILE 0

class CfgPatches
{
	class d_cse_to_uac
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"cse_f_configuration", "d_uac"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.3;
	};
};


class CfgFunctions
{
	class d_cse_to_uac
	{
		class Main
		{
			file="\xx\addons\d_cse_to_uac\code";

			
			class _valueHandlerKB_get {recompile=RECOMPILE;};
			class _valueHandlerKB_set {recompile=RECOMPILE;};
			class _valueHandlerO_get {recompile=RECOMPILE;};
			class _valueHandlerO_set {recompile=RECOMPILE;};			
			// real CSE functions

			class _CSE_settingsDefineDetails_f
			{
				file = "\cse\cse_f_configuration\functions\fn_settingsDefineDetails_f.sqf";
			};
			class _CSE_getKeyBindingFromProfile_f
			{
				file = "\cse\cse_f_configuration\functions\fn_getKeyBindingFromProfile_f.sqf";
			};
			class _CSE_addClientSideOptions_f
			{
				file = "\cse\cse_f_configuration\functions\fn_addClientSideOptions_f.sqf";
			};
			class _CSE_getClientSideOptionFromProfile_f
			{
				file = "\cse\cse_f_configuration\functions\fn_getClientSideOptionFromProfile_f.sqf";
			};

		};
	};
	


// overriding CSE functions
class CSE
	{
		class Configuration
		{
			class settingsDefineDetails_f
			{
				file = "\xx\addons\d_cse_to_uac\code\fn__settingsDefineDetails_f_wrapper.sqf";
				recompile=RECOMPILE;
			};
			class getKeyBindingFromProfile_f
			{
				file = "\xx\addons\d_cse_to_uac\code\fn__getKeyBindingFromProfile_f_wrapper.sqf";
				recompile=RECOMPILE;
			};
			class addClientSideOptions_f
			{
				file = "\xx\addons\d_cse_to_uac\code\fn__addClientSideOptions_f_wrapper.sqf";
				recompile=RECOMPILE;
			};
			class getClientSideOptionFromProfile_f
			{
				file = "\xx\addons\d_cse_to_uac\code\fn__getClientSideOptionFromProfile_f_wrapper.sqf";
				recompile=RECOMPILE;
			};			
		};
	};
};




class RscStandardDisplay;

class RscDisplayMPInterrupt: RscStandardDisplay
{
	class controls
	{
		delete CSE_Tile;
		delete cse_Open_settingsMenu_Btn;
	};
};
class RscDisplayInterrupt: RscStandardDisplay
{
	class controls
	{
		delete CSE_Tile;
		delete cse_Open_settingsMenu_Btn;
	};
};
class RscDisplayInterruptEditor3D: RscStandardDisplay
{
	class controls
	{
		delete CSE_Tile;
		delete cse_Open_settingsMenu_Btn;
	};
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay
{
	class controls
	{
		delete CSE_Tile;
		delete cse_Open_settingsMenu_Btn;
	};
};
