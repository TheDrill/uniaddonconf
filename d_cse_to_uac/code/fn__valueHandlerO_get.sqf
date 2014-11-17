#include "addon.hpp"

PV(_value_name) =  _this select 0;

PV(_CSE_name) = _value_name select [6];

{
	if (_x select 0 == _CSE_name) exitWith
	{	
		_x select 2;
	};
} forEach CSE_F_CLIENT_SIDE_SETTINGS;

