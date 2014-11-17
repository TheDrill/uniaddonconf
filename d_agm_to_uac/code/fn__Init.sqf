#include "addon.hpp"

[] spawn{



[localize "STR_Addons__d_agm_to_uac__AGM_Keys_Category", 6.20001] call d_uac_fnc_SetSectionPriority;
[localize "STR_Addons__d_agm_to_uac__AGM_Options_Category", 6.2] call d_uac_fnc_SetSectionPriority;



// custom sort strings for some keys
/*
_keys_custom_sortstrings = [
	["AGM_Key_switchGrenadeMode", "AGM_keys"],
	["AGM_Key_Earplugs", "AGM_keys"],
	["AGM_Key_openInteractionMenu", "AGM_keys"],
	["AGM_Key_openInteractionMenuSelf", "AGM_keys"],
	["AGM_Key_openDoor", "AGM_keys"],
	["AGM_Key_tapShoulder", "AGM_keys"],
	["AGM_Key_increaseNVGBrightness", "AGM_keys"],
	["AGM_Key_decreaseNVGBrightness", "AGM_keys"],
	["AGM_Key_checkAmmo", "AGM_keys"],
	["AGM_Key_restWeapon", "AGM_keys"],
	["AGM_Key_speedLimiter", "AGM_keys"],
	["AGM_Key_selectPistol", "AGM_keys"],
	["AGM_Key_selectRifle", "AGM_keys"],
	["AGM_Key_selectLauncher", "AGM_keys"],
	["AGM_Key_selectRifleMuzzle", "AGM_keys"],
	["AGM_Key_selectBinocular", "AGM_keys"],
	["AGM_Key_holsterWeapon", "AGM_keys"],
	["AGM_Key_engineOn", "AGM_keys"],
	["AGM_Key_engineOff", "AGM_keys"],
	["AGM_Key_selectMaingun", "AGM_keys"],
	["AGM_Key_selectMachineGun", "AGM_keys"],
	["AGM_Key_selectMissile", "AGM_keys"],
	["AGM_Key_checkTemperature", "AGM_keys"],
	["AGM_Key_wipeGlasses", "AGM_keys"],
	["AGM_Key_laseTarget", "AGM_keys"]
];
*/









// keys

_valueHndKey = [
	{
		PV(_agmk) = profileNamespace getVariable (_this select 0);
		PV(_keycode) = floor _agmk;
		_agmk = floor ((_agmk * 10) % 10);
		PV(_shift) = _agmk % 2;
		PV(_ctrl) = (_agmk / 2) % 2;
		PV(_alt) = (_agmk / 4) % 2;
		
		[_keycode, _shift == 1, _ctrl == 1, _alt == 1]
	}
	,
	{
		profileNamespace setVariable [_this select 0, (_this select 1) call AGM_Core_fnc_convertKeyCode];
	},
	[] // disable UAC profile saving feature --- values of AGM are contained in profileNamespace anyway
];


_configs = configFile >> "AGM_Core_Default_Keys";
_count = count _configs;

for "_i" from 0 to (_count - 1) do
{
	_config = _configs select _i;
	
	
	
	_varname = format["AGM_Key_%1", configName _config];
	_desc = getText (_config >> "displayName");
	
	_sortstring = "AGM_keys";
	
/*	{
		if ((_x select 0) == _varname) exitWith
		{
			_sortstring = _x select 2;
		};
	} forEach _keys_custom_sortstrings;
*/
	
	_dval = [getNumber(_config >> "key"), getNumber(_config >> "shift") == 1,
		getNumber(_config >> "ctrl") == 1, getNumber(_config >> "alt") == 1];
	
	//profileNamespace setVariable [_varname, _dval call AGM_Core_fnc_convertKeyCode];
	[_varname, _dval] call d_uac_fnc_setParameterDefaultValue;
	
	[_varname, localize "STR_Addons__d_agm_to_uac__AGM_Keys_Category", _desc, 
		_sortstring, _valueHndKey, d_uac_fnc_type_keyBinding, []]
		call d_uac_fnc_RegisterParameter;	
};



// bools

_valueHndBool = [
	{
		profileNamespace getVariable (_this select 0);
	}
	,
	{
		profileNamespace setVariable [_this select 0, _this select 1];
	}
];


_configs = configFile >> "AGM_Core_Options";
_count = count _configs;

for "_i" from 0 to (_count - 1) do
{
	_config = _configs select _i;
	
	_varname = format["AGM_%1", configName _config];
	_desc = getText (_config >> "displayName");

	_dval = (getNumber(_config >> "default") == 1);
	
	//profileNamespace setVariable [_varname, _dval];
	[_varname, _dval] call d_uac_fnc_setParameterDefaultValue;
	
	[_varname, localize "STR_Addons__d_agm_to_uac__AGM_Options_Category", _desc, 
		"AGM_options", _valueHndBool, d_uac_fnc_type_boolean, []]
		call d_uac_fnc_RegisterParameter;	
};



};
