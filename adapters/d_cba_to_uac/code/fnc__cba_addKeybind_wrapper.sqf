#include "addon.hpp"


PV(_rv) = _this call CFUNC(_cba_addKeybind_real);



if (isNil 'GVAR(valueHandlers)') then
{
	[] call CFUNC(_valueHandlers_init);
};




PV(_addon) = _this select 0;
PV(_actname) = _this select 1;
PV(_desc) = _this select 2;
PV(_def_val) = _this select 5;



PV(_uac_param_id) = "cba_" + _addon + "_" + _actname;




GVAR(registeredParams) = missionNamespace getVariable
	['GVAR(registeredParams)', []];

if (_uac_param_id in GVAR(registeredParams)) exitWith {_rv;};

GVAR(registeredParams) pushBack _uac_param_id;



if (isNil {_def_val}) then {_def_val = [0, false, false, false];};
if (typeName _desc == "ARRAY") then {_desc = _desc select 0;};




// correct _def_val
if (count _def_val == 2) then
{
	_def_val = [_def_val select 0] + (_def_val select 1);
};




PV(_vh_param) = [_addon, _actname];




[_uac_param_id, _def_val] call d_uac_fnc_setParameterDefaultValue;


[_uac_param_id, _addon + " (CBA)", _desc,
		"", [GVAR(valueHandlers), _vh_param], d_uac_fnc_type_keyBinding, []]
			call d_uac_fnc_RegisterParameter;







_rv;
