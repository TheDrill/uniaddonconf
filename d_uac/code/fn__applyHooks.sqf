#include "addon.hpp"
#include "main.hpp"


PV(_fname) = _this select 0;
PV(_thiscopy) = + (_this select 1);

PV(_rv) = 0;
if (!isNil ('GVAR(Hooks__)' + _fname)) then
{
	PV(_t) = missionNamespace getVariable ['GVAR(Hooks__)' + _fname, []];
	
	{
		_rv = [_x select 0, _thiscopy] call (_x select 1);
		
		if (_rv < 0) exitWith {};
	} forEach _t;
};

if (_rv < 0) then
{
	false;
}
else
{
	_thiscopy;
};
