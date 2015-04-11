#define RECOMPILE 0

class CfgPatches
{
	class d_cba_to_uac
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"cba_keybinding", "d_uac"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.3;
	};
};



class CfgFunctions
{
	class CBA
	{
		class Keybinding
		{
			class addKeybind
			{
				file = "\xx\addons\d_cba_to_uac\code\fnc__cba_addKeybind_wrapper.sqf";
				recompile = RECOMPILE;
			};
		};
	};

	class d_cba_to_uac
	{
		class Main
		{
			file="\xx\addons\d_cba_to_uac\code";
			
			class _valueHandlers_init {recompile = RECOMPILE;};
				
			class _cba_addKeybind_real 
				{file = "\x\cba\addons\keybinding\fnc_addKeybind.sqf";};
		};
	};
};


