#include "addon.hpp"

#define LOCALIZE_PREFIX "STR_Addons__d_tua3ts3_to_uac__"

#define PARAM_PREFIX "TuA3TS3_"
#define PARAM_PREFIX_LEN 8

[] spawn{




_valueHndKey = [
	{ // get
		PV(_pid) = toArray (_this select 0);
		
		reverse _pid;
		_pid resize ((count _pid) - PARAM_PREFIX_LEN);
		reverse _pid;
		_pid = toString _pid;
	
		PV(_i) = -1;
		{
			if (_x == _pid) exitWith {_i = _forEachIndex;};
		} forEach tush_class_key;
		
		if (_i < 0) then
		{
			nil
		}
		else
		{
			[tush_radio_key select _i, (tush_radio_shift_key select _i) != 0, 
				(tush_radio_ctrl_key select _i) != 0, (tush_radio_alt_key select _i) != 0];
		};
	}
	,
	{ // set
		PV(_pid) = toArray (_this select 0);
		PV(_newval) = _this select 1;
		
		reverse _pid;
		_pid resize ((count _pid) - PARAM_PREFIX_LEN);
		reverse _pid;
		_pid = toString _pid;
		
		
	
		PV(_i) = -1;
		{
			if (_x == _pid) exitWith {_i = _forEachIndex;};
		} forEach tush_class_key;
		
		if (_i >= 0) then
		{
			tush_radio_key set [_i, _newval select 0];
			tush_radio_shift_key set [_i, if(_newval select 1)then{1}else{0}];
			tush_radio_ctrl_key set [_i, if(_newval select 2)then{1}else{0}];
			tush_radio_alt_key set [_i, if(_newval select 3)then{1}else{0}];
		};
	}
];



waitUntil
{
	sleep 1;
	!isNil {tush_keyUp};
};


{
	PV(_loc) = localize (LOCALIZE_PREFIX + _x);
	
	if (_loc == "") then {_loc = _x;};
	
	[PARAM_PREFIX + _x, localize "STR_Addons__d_tua3ts3_to_uac__KeysSection", _loc, 
		"TuA3TS3", _valueHndKey, d_uac_fnc_type_keyBinding, []]
		call d_uac_fnc_RegisterParameter;	
} forEach tush_class_key;


};
