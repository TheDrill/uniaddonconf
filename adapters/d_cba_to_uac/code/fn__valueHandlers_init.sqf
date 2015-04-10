#include "addon.hpp"

#define CKB(x) cba_keybinding_##x
#define CBAFUNC(x) CBA_fnc_##x

GVAR(valueHandlers) = [
	{ // get
		PV(_pinfo) = _this select 1;
		
		PV(_addon) = _pinfo select 0;
		PV(_actname) = _pinfo select 1;
					
		PV(_hnd) = [_addon, _actname] call CBAFUNC(getKeybind);
		
		if (isNil {_hnd}) exitWith {[0, false, false, false];};
		
		PV(_val) = _hnd select 5;
		if (count _val == 2) then {_val = [_val select 0] + (_val select 1);};
				
		_val;
	}
	,
	{ // set
		PV(_newval) = _this select 1;
		PV(_pinfo) = _this select 2;
		
		PV(_addon) = _pinfo select 0;
		PV(_actname) = _pinfo select 1;
					
		PV(_hnd) = [_addon, _actname] call CBAFUNC(getKeybind);
		
		if (isNil {_hnd}) exitWith {;};
		
		_hnd set [ 5, [_newval select 0, 
			[_newval select 1, _newval select 2, _newval select 3]] ];
		
		(_hnd + [true]) call CFUNC(_cba_addKeybind_real);
	}
];
