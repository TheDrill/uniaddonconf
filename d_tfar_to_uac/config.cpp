class CfgPatches
{
	class d_tfar_to_uac
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"task_force_radio", "d_uac"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.2;
	};
};


class CfgFunctions
{
	class d_tfar_to_uac
	{
		class Main
		{
			file="\xx\addons\d_tfar_to_uac\code";
			class _Init
			{
				preInit=0;
				postInit=1;
				recompile=0;
			};
		};
	};
};


