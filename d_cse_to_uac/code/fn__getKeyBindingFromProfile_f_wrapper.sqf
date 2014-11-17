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

if (_type != "") then
{
	PV(_dv) = _this select 2;

	["CSE_" + _type + "_" + (_this select 0), 
		[_dv select 0, (_dv select 1) == 1, (_dv select 2) == 1, (_dv select 3) == 1]
		] call d_uac_fnc_setParameterDefaultValue;
};

_this call CFUNC(_CSE_getKeyBindingFromProfile_f);
