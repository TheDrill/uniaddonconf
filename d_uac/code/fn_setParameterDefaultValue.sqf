#include "addon.hpp"
#include "main.hpp"


//
//  d_uac_fnc_setParameterDefaultValue
//
//  Description:
//    This function could be used to explicitly set default value of a parameter. It might be
//    either before registering the parameter or after.
//
//  Arguments:
//    0:(str) Parameter id --- parameter id.
//    1:() Value --- new default value for the parameter.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      my_keybinding = [24, false, true, false]; // Ctrl + O
//      ["My section", "my_keybinding", "MyAddonID", "Open door keybinding"] call d_uac_fnc_registerKeyBindingVariable;
//      ["My section", "my_keybinding", [24, true, false, false]] call d_uac_fnc_setParameterDefaultValue; // change default value from "Ctrl + O" to "Shift + O"
//



//  Run function in synchronized environment

if ([CFUNC(setParameterDefaultValue), _this] call CFUNC(_syncRun)) exitWith {};

[] call CFUNC(_initUAC);







PV(_paramid) = _this select 0;
PV(_defval) = _this select 1;





PV(_ei) = MAP_IKEY(GVAR(Entries), _paramid);

if (_ei >= 0) then
{
	PV(_ent) = MAP_IGET(GVAR(Entries), _ei);
	_ent set [ENTRY__DEFAULT_VALUE, _defval];
	
	
	// forcing default value if there's no stored value in profile
	
	PV(_allow_defval) = true;
	PV(_valhnd) = _ent select ENTRY__VALUEHND;
	PV(_typehnd) = _ent select ENTRY__TYPEHND;
	PV(_typeopt) = _ent select ENTRY__TYPEOPT;
	PV(_paramid) = _ent select ENTRY__PARAMID;
	PV(_defval) = _ent select ENTRY__DEFAULT_VALUE;
	PV(_valhndparams) = _ent select ENTRY__VALUEHNDPARAMS;
	
	PV(_pnval) = nil;
	if (count _valhnd >= 3) then
	{
		PV(_profhnd) = _valhnd select VALUEHND__PROFHND;
		if (count _profhnd >= 2) then
		{
			_pnval = [_paramid, _valhndparams] call (_profhnd select PROFHND_READFNC);
		}
		else
		{
			_allow_defval = false;
		};
	}
	else
	{
		_pnval = [_paramid] call CFUNC(_readFromProfileNamespace);
	};



	if ( _allow_defval && { isNil {_pnval} ||
		{!([_pnval, _typeopt] call (_typehnd select TYPEHND__VALIDVALFNC))} } ) then
	{
		[_paramid, _defval, _valhndparams] call (_valhnd select VALUEHND__WRITEFNC);
	};

}
else
{ // entry doesn't yet exist - add as pending default value
	if (isNil 'GVAR(pendingParameterDefaultValues)') then
	{
		GVAR(pendingParameterDefaultValues) = CREATE_MAP();
	};
	
	MAP_SET(GVAR(pendingParameterDefaultValues), _paramid, _defval);
};
