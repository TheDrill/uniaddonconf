class CfgPatches
{
	class d_bwa_to_uac
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"BWA3_Common", "d_uac"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.2;
	};
};


class CfgFunctions
{
	class d_bwa_to_uac
	{
		class Main
		{
			file="\xx\addons\d_bwa_to_uac\code";
			class _Init
			{
				preInit=1;
				postInit=0;
				recompile=0;
			};
		};
	};
};




class RscStandardDisplay;

class RscDisplayMPInterrupt: RscStandardDisplay
{
	class controls
	{
		delete BWA3_Tile;
	};
};
class RscDisplayInterrupt: RscStandardDisplay
{
	class controls
	{
		delete BWA3_Tile;
	};
};
class RscDisplayInterruptEditor3D: RscStandardDisplay
{
	class controls
	{
		delete BWA3_Tile;
	};
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay
{
	class controls
	{
		delete BWA3_Tile;
	};
};
