#include "addon.hpp"

#define CKB(x) cba_keybinding_##x
#define CBAFUNC(x) CBA_fnc_##x

GVAR(valueHandlers) = [
	{ // get
		PV(_pinfo) = _this select 1;
		
		PV(_addon) = _pinfo select 0;
		PV(_actname) = _pinfo select 1;
		PV(_khtype) = _pinfo select 2;
					
		PV(_hi) = [_addon, _actname, _khtype] call CBAFUNC(getKeybind);
		
		if (_hi < 0) exitWith {[0, false, false, false];};
		
		PV(_hnd) = CKB(handlers) select _hi;
		
		PV(_val) = _hnd select 2;
		
		_val;
	}
	,
	{ // set
		PV(_newval) = _this select 1;
		PV(_pinfo) = _this select 2;
		
		PV(_addon) = _pinfo select 0;
		PV(_actname) = _pinfo select 1;
		PV(_khtype) = _pinfo select 2;
					
		PV(_hi) = [_addon, _actname, _khtype] call CBAFUNC(getKeybind);
		
		if (_hi < 0) exitWith {;};
		
		PV(_hnd) = CKB(handlers) select _hi;
		_hnd set [2, _newval];
		
		
		[_addon, _actname, _hnd select 3, _newval, true, _hnd select 5]
			call CFUNC(_cba_registerKeybind_real);
	}
];
