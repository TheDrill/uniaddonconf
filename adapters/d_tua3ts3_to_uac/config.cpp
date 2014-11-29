class CfgPatches
{
	class d_tua3ts3_to_uac
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"tush_a3_ts3", "d_uac"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.2;
	};
};


class CfgFunctions
{
	class d_tua3ts3_to_uac
	{
		class Main
		{
			file="\xx\addons\d_tua3ts3_to_uac\code";
			class _Init
			{
				preInit=0;
				postInit=1;
				recompile=0;
			};
		};
	};
};


