#include "addon.hpp"

PV(_value_name) =  _this select 0;



PV(_CSE_name) = toArray _value_name;
PV(_len) = count _CSE_name;

reverse _CSE_name;
_CSE_name resize (_len - 6);
reverse _CSE_name;
_CSE_name = toString _CSE_name;



PV(_type) = toString ([(toArray _value_name) select 4]);
PV(_arrname) = "";


if (_type == "a") then
{
	_arrname = "CSE_F_KEYBINDINGS_ACTIONS";
};

if (_type == "m") then
{
	_arrname = "CSE_F_KEYBINDINGS_MENUS";
};

PV(_arr) = missionNamespace getVariable _arrname;

{
	if (_x select 0 == _CSE_name) exitWith
	{
		PV(_rv) = _x select 1;
		[_rv select 0, (_rv select 1) == 1, (_rv select 2) == 1, (_rv select 3) == 1]
	};
} forEach _arr;
