#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_removeHook
//
//  Description:
//    Removes hook with given id from specified function. For more info about hooks see
//   addHook description.
//    
//
//  Arguments:
//    0:(str) function name --- short function name to remove hook from. Possible values are:
//        1. "registerParameter".
//    1:(int) hook id  --- the id of hook to be removed
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      ["registerParameter", _hook_id] call d_uac_fnc_removeHook
//
//

PV(_fname) = _this select 0;
PV(_hid) = _this select 1;


if (!isNil ('GVAR(Hooks__)' + _fname)) then
{
	PV(_t) = missionNamespace getVariable ['GVAR(Hooks__)' + _fname, []];
	
	{
		if (_x select 0 == _hid) exitWith
		{
			_t deleteAt _forEachIndex;
		};
	} forEach _t;
};


