class CfgPatches
{
	class uac_menu_config
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"d_uac"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.3;
	};
};


class CfgFunctions
{
	class uac_menu_config
	{
		class Main
		{
			file="\xx\addons\uac_menu_config";
			class _Init
			{
				preInit=0;
				postInit=1;
				recompile=0;
			};
		};
	};
};

