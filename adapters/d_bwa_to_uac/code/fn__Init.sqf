#include "addon.hpp"

[] spawn{



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
		profileNamespace setVariable [_this select 0, (_this select 1) call BWA3_fnc_convertKeyCode];
	}
	,
	[] // disable UAC profile saving feature --- in BWA values are contained in profileNamespace anyway
];


_configs = configFile >> "BWA3_Default_Keys";
_count = count _configs;

for "_i" from 0 to (_count - 1) do
{
	_config = _configs select _i;
	
	_varname = format["BWA3_Key_%1", configName _config];
	_desc = localize format["STR_BWA3_%1", configName _config];
	
	if (_desc == "") then
	{
		_desc = localize format["STR_Addons__d_bwa_to_uac__%1", configName _config];
	};
	
	_dval = [getNumber(_config >> "Key"), getNumber(_config >> "Shift") == 1,
		getNumber(_config >> "Control") == 1, getNumber(_config >> "Alt") == 1];
	
	//profileNamespace setVariable [_varname, _dval call BWA3_fnc_convertKeyCode];
	[_varname, _dval] call d_uac_fnc_setParameterDefaultValue;
	
	[_varname, localize "STR_Addons__d_bwa_to_uac__BWA_Keys_Category", _desc, 
		"BWA3_keys", _valueHndKey, d_uac_fnc_type_keyBinding, []]
		call d_uac_fnc_RegisterParameter;	
};


};
