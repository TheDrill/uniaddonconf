#include "addon.hpp"

PV(_type) = "";
PV(_sectname) = "";


if (toLower (_this select 1) == "action") then
{
	_type = "a";
	_sectname = localize "STR_Addons__d_cse_to_uac__ActionKeys_Section";
};

if (toLower (_this select 1) == "menu") then
{
	_type = "m";
	_sectname = localize "STR_Addons__d_cse_to_uac__MenuKeys_Section";
};

if (toLower (_this select 1) == "option") then
{
	_type = "o";
	_sectname = localize "STR_Addons__d_cse_to_uac__Options_Section";
};

if (_type != "") then
{
	if (_type == "o") then
	{
		PV(_popts) = missionNamespace getVariable ['GVAR(_o_)' + (_this select 0), []];
	
		["CSE_o_" + (_this select 0), _sectname, _this select 2, "CSE",
			[CFUNC(_valueHandlerO_get), CFUNC(_valueHandlerO_set)],
			d_uac_fnc_type_enum, [_popts select 0, false]]
			call d_uac_fnc_registerParameter;
	}
	else
	{
		["CSE_" + _type + "_" + (_this select 0), _sectname, _this select 2, "CSE",
			[CFUNC(_valueHandlerKB_get), CFUNC(_valueHandlerKB_set)],
			d_uac_fnc_type_keyBinding, []]
			call d_uac_fnc_registerParameter;
	};	
};

_this call CFUNC(_CSE_settingsDefineDetails_f);
