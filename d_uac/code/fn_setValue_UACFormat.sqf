#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_setValue_UACFormat
//
//  Description:
//    Sets parameter value using inside UAC format (see parameter type description)
//
//  Arguments:
//    0:(str) Parameter id --- parameter's id.
//    1:() New value --- new value for the parameter
//    2:(bool) Save to profile [optional, default = false] --- save new value to the profile
//      It would be needed to call saveProfileNamespace manually to write profile to disk after all values
//      are changed.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      ["my_bool_option", true] call d_uac_fnc_setValue_UACFormat
//
//



//  Run function in synchronized environment
if ([CFUNC(setValue_UACFormat), _this] call CFUNC(_syncRun)) exitWith {};

[] call CFUNC(_initUAC);



PV(_paramid) = _this select 0;
PV(_newval) = _this select 1;

PV(_save_to_profile) = false;

if (count _this  >= 3) then
{
	_save_to_profile = _this select 2;
};




PV(_i) = MAP_IKEY(GVAR(Entries), _paramid);

if (_i >= 0) then
{
	PV(_ent) = MAP_IGET(GVAR(Entries), _i);
	
	if ( [_newval, _ent select ENTRY__TYPEOPT] call 
				((_ent select ENTRY__TYPEHND) select TYPEHND__VALIDVALFNC) )
		then
	{
		[_paramid, _newval, _ent select ENTRY__VALUEHNDPARAMS] call ((_ent select ENTRY__VALUEHND) select VALUEHND__WRITEFNC);
		
		if (_save_to_profile) then
		{
			if (count (_ent select ENTRY__VALUEHND) >= 3) then
			{
				PV(_profhnd) = (_ent select ENTRY__VALUEHND) select VALUEHND__PROFHND;
				if (count _profhnd >= 2) then
				{
					[_ent select ENTRY__PARAMID, _newval, _ent select ENTRY__VALUEHNDPARAMS] call (_profhnd select PROFHND_WRITEFNC); 
				};
			}
			else
			{
				[(_ent select ENTRY__PARAMID), _newval] call CFUNC(_writeToProfileNamespace);
			};
		};
	}
	else
	{
		diag_log format ["d_uac_fnc_setValue_UAC_Format: wrong value format for %1", _this];
	};
};
