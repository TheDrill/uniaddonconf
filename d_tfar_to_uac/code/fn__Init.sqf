#include "addon.hpp"

#define LOCALIZE_PREFIX "STR_Addons__d_tfar_to_uac__"

#define PARAM_PREFIX "TFAR_"
#define PARAM_PREFIX_LEN 5

#define CEV(x) cba_events_##x
#define CUI(x) cba_ui_##x

[] spawn{









GVAR(all_keys) =
[
	[ 2, "b", "tangent_sw"           ,"11"],
	[ 3, "d", "sw_channel_1"         ,"35"],
	[ 4, "d", "sw_channel_2"         ,"35"],
	[ 5, "d", "sw_channel_3"         ,"35"],
	[ 6, "d", "sw_channel_4"         ,"35"],
	[ 7, "d", "sw_channel_5"         ,"35"],
	[ 8, "d", "sw_channel_6"         ,"35"],
	[ 9, "d", "sw_channel_7"         ,"35"],
	[10, "d", "sw_channel_8"         ,"35"],
	[11, "b", "tangent_lr"           ,"12"],
	[13, "d", "lr_channel_1"         ,"45"],
	[14, "d", "lr_channel_2"         ,"45"],
	[15, "d", "lr_channel_3"         ,"45"],
	[16, "d", "lr_channel_4"         ,"45"],
	[17, "d", "lr_channel_5"         ,"45"],
	[18, "d", "lr_channel_6"         ,"45"],
	[19, "d", "lr_channel_7"         ,"45"],
	[20, "d", "lr_channel_8"         ,"45"],
	[21, "d", "lr_channel_9"         ,"45"],
	[22, "b", "tangent_dd"           ,"13"],
	[23, "d", "dialog_dd"            ,"23"],
	[24, "d", "speak_volume"         ,"299"],
	[25, "d", "sw_stereo_both"       ,"5"],
	[26, "d", "sw_stereo_left"       ,"5"],
	[27, "d", "sw_stereo_right"      ,"5"],
	[28, "d", "lr_stereo_both"       ,"5"],
	[29, "d", "lr_stereo_left"       ,"5"],
	[30, "d", "lr_stereo_right"      ,"5"],

	[31, "u", "sw_cycle_next"         ,"5"],
	[32, "u", "sw_cycle_prev"         ,"5"],
	[33, "u", "lr_cycle_next"         ,"5"],
	[34, "u", "lr_cycle_prev"         ,"5"],

	[34, "b", "tangent_additional_sw","5"],
	[35, "b", "tangent_additional_lr","5"]
];


GVAR(flexi_menu_keys) =
[
	["dialog_sw", '_this call TFAR_fnc_swRadioMenu', "21"],
	["dialog_lr", '_this call TFAR_fnc_lrRadioMenu', "22"]
];





_valueHndKey = [
	{ // get
		PV(_pid) = toArray (_this select 0);
		
		reverse _pid;
		_pid resize ((count _pid) - PARAM_PREFIX_LEN);
		reverse _pid;
		_pid = toString _pid;

		PV(_type) = nil;
		{
			if (_x select 2 == _pid) exitWith {_type = _x;};
		} forEach GVAR(all_keys);		
		if (isNil {_type}) exitWith {[0, false, false, false];};
		
		PV(_val) = [0, [false, false, false]];
		if (_type select 1 != "u") then
		{
			 _val = [CEV(keyhandlers_down), str (_type select 0)] call CBA_fnc_hashGet;
		}
		else
		{
			_val = [CEV(keyhandlers_up), str (_type select 0)] call CBA_fnc_hashGet;
		};
		
		if (!isNil {_val} && {count _val >= 2}) then
		{
			[_val select 0] + (_val select 1);
		}
		else
		{
			[0, false, false, false];
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
		
		PV(_type) = nil;
		{
			if (_x select 2 == _pid) exitWith {_type = _x;};
		} forEach GVAR(all_keys);		
		if (isNil {_type}) exitWith {};

		
		
		if (_type select 1 != "u") then
		{
			[str(_type select 0), _newval select 0, [_newval select 1, _newval select 2, _newval select 3],
				"keydown"] call CBA_fnc_changeKeyHandler;
				
			if (_type select 1 == "b") then
			{
				["_" + (str (_type select 0)), _newval select 0, [_newval select 1, _newval select 2, _newval select 3],
				"keyup"] call CBA_fnc_changeKeyHandler;
			};
		}
		else
		{
			[str(_type select 0), _newval select 0, [_newval select 1, _newval select 2, _newval select 3],
				"keyup"] call CBA_fnc_changeKeyHandler;
		};
	}
];






_valueHndKey_flexiMenu = [
	{ // get
		PV(_pid) = toArray (_this select 0);
		
		reverse _pid;
		_pid resize ((count _pid) - PARAM_PREFIX_LEN);
		reverse _pid;
		_pid = toString _pid;

		PV(_type) = nil;
		{
			if (_x select 0 == _pid) exitWith {_type = _x;};
		} forEach GVAR(flexi_menu_keys);		
		if (isNil {_type}) exitWith {[0, false, false, false];};
		

		PV(_e) = nil;
		{
			if (_x select 3 == _type select 1) exitWith {_e = _x;};
		} forEach CUI(typeMenuSources);
		
		if (isNil {_e}) then
		{
			[0, false, false, false];
		}
		else
		{
			PV(_kmods) = ((_e select 1) select 0) select 1;
			
			[((_e select 1) select 0) select 0] + _kmods;
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
		
		PV(_type) = nil;
		{
			if (_x select 0 == _pid) exitWith {_type = _x;};
		} forEach GVAR(flexi_menu_keys);		
		if (isNil {_type}) exitWith {};

		
		PV(_e) = nil;
		{
			if (_x select 3 == _type select 1) exitWith {_e = _x;};
		} forEach CUI(typeMenuSources);
		
		if (!isNil {_e}) then
		{
			_e set [1, [[_newval select 0, [_newval select 1, _newval select 2, _newval select 3] ]] ];
		};
	}
];



waitUntil
{
	sleep 1;
	!isNil {[CEV(keyhandlers_down), "35"] call CBA_fnc_hashGet;};
};



{
	PV(_loc) = localize (LOCALIZE_PREFIX + (_x select 2));
	
	if (_loc == "") then {_loc = (_x select 2);};
	
	[PARAM_PREFIX + (_x select 2), localize "STR_Addons__d_tfar_to_uac__KeysSection", _loc,
		"TFAR" + (_x select 3), _valueHndKey, d_uac_fnc_type_keyBinding, []] call d_uac_fnc_RegisterParameter;	
} forEach GVAR(all_keys);


{
	PV(_loc) = localize (LOCALIZE_PREFIX + (_x select 0));
	
	if (_loc == "") then {_loc = (_x select 0);};
	
	[PARAM_PREFIX + (_x select 0), localize "STR_Addons__d_tfar_to_uac__KeysSection", _loc,
		"TFAR" + (_x select 2), _valueHndKey_flexiMenu, d_uac_fnc_type_keyBinding, []] call d_uac_fnc_RegisterParameter;	
} forEach GVAR(flexi_menu_keys);


};
