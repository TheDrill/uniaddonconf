#include "addon.hpp"

PV(_value_name) =  _this select 0;
PV(_value) =  _this select 1;



PV(_CSE_name) = _value_name select [6];

{
	if (_x select 0 == _CSE_name) exitWith
	{	
		_x set [2, _value];
		[_CSE_name, _value] call (_x select 3);
	};
} forEach CSE_F_CLIENT_SIDE_SETTINGS;
