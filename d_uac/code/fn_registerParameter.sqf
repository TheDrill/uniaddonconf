#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_registerParameter
//
//  Description:
//    This function is most low-end and flexible way to register new parameter to UniAddonConf.
//    It allow both to define parameter type and to define the way parameter value should be handled.
//    The function reads parameter's current value and treats it as default value. It then restores
//    the value saved in user profile.
//
//  Arguments:
//    0:(str) Parameter id --- parameter id (should be unique) used by the UniAddonConf internally.
//    1:(str) Section --- section name in which the parameter would appear. If section with such name 
//        doesn't exist, it would be created.
//    2:(str) Parameter name --- the name of parameter which would be displayed in GUI
//    3:(str) Sorting string --- this is string which is used to sort parameters in the list.
//        Its main purpose is to group parameters of the same addon together. If several 
//        parameters have the same sorting string, then they would persist the order in which
//        they were registered. The most common way to fill in this argument is just pass
//        your addon's name.
//    4:(array) Value access handlers --- array of two functions [read_func, write_func]. These functions
//        define the way UniAddonConf should read/write parameter value from/to the rest of the game.
//        These functions might be used to transform parameter values between UniAddonConf format to 
//        any other convenient way. 
//        Functions description:
//          read_func must be a function which receives [parameter_id] as argument and return the current
//            value of the parameter.
//          write_func must be a function which receives [parameter_id, value] as argument and applies new
//            value of parameter
//        See fnc_registerVariable definition for example 
//        [Optional] It's possible to provide as argument: [read_func, write_func, []] --- that would disable
//          UAC automatic saving/reading of parameter value in profile namespace for permanent storage
//        [Optional] It's possible to provide as argument: [read_func, write_func, [prof_read_func, prof_write_func]] --- 
//          that would force UAC to use function prof_read_func/prof_write_func for reading/writing to profile namespace.
//    5:(fnc/array) Type handlers --- function which returns array of four functions 
//        [desc_fnc, change_fnc, compare_fnc, valid_val_fnc] (or directly the array) which fully describe and handle the parameter
//        type. 
//		  Functions descriptions:
//          desc_fnc --- receives [type_arguments_array, value] as argument and should return user-friendly
//            string representing the parameter value
//          change_fnc --- receives [type_arguments_array, value, default_value] as argument and should handle
//            creating the dialog window for user to assign new value of parameter and return the new value
//          compare_fnc --- receives [value_1, value_2, type_arguments_array] as argument and returns true if the parameters are equal and
//            false otherwise.
//          valid_val_fnc --- receives [value, type_arguments_array] as argument and returns true if the argument is correct value for the 
//            type and false otherwise
//		  There're several predefined types in UniAddonConf: 
//          1. d_uac_fnc_type_boolean --- defines boolean-type parameters.
//          2. d_uac_fnc_type_KeyBinding --- defines key binding parameters.
//    6:(array) Type arguments --- array of additional type-specific arguments.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      See fnc_registerVariable definition for example
//
//



//
// Arguments:  [ "Section", "parameter id", "parameter name", "sorting string", value access handlers, parameter type options (description, etc), parameter type (3 handling functions) ]
//





//  Run function in synchronized environment

if ([CFUNC(registerParameter), _this] call CFUNC(_syncRun)) exitWith {};

[] call CFUNC(_initUAC);



PV(_this_ah) = ["registerParameter", _this] call CFUNC(_applyHooks);
if (_this_ah isEqualTo false) exitWith {};


PV(_varname) = _this_ah select 0;
PV(_sectname) = _this_ah select 1;
PV(_paramdesc) = [_this_ah select 2];
PV(_sortstr) = _this_ah select 3;
PV(_valhnd) = _this_ah select 4;
PV(_typehnd) = _this_ah select 5;
PV(_typeopt) = _this_ah select 6;

if (typeName _typehnd == "CODE") then
{
	_typehnd = [] call _typehnd;
};


if (typeName _sortstr == "STRING") then
{
	_sortstr = toArray _sortstr;
};

if (count _sortstr == 0) then
{
	_sortstr = [10000];
};



PV(_valhndparams) = [];

if (typeName (_valhnd select 0) == "ARRAY") then // first is ARRAY --- then the second must be valuehnd parameter
{
	_valhndparams = _valhnd select 1;
	_valhnd = _valhnd select 0;
};

// deleting old entry with the same name if exists

[_varname] call CFUNC(deleteParameter);




PV(_i) = -1;

{
	if (_x select SECT__SECTNAME == _sectname) exitWith
	{
		_i = _forEachIndex;
	};
} forEach GVAR(Sections);






if (_i == -1) then
{ // create section with default (= 0) or pending priority
	PV(_prio) = DEFAULT_SECTION_PRIORITY;
	
	If (!isNil 'GVAR(pendingSectionPriorities)') then
	{
		_i = -1;
		{
			if (_x select 0 == _sectname) exitWith
			{
				_prio = _x select 1;
				_i = _forEachIndex;
			};
		} forEach GVAR(pendingSectionPriorities);
		
		if (_i >= 0) then
		{ // delete entry if found
			GVAR(pendingSectionPriorities) deleteAt _i;
		};
	};
	
	
	_i = [_sectname, _prio, -1] call CFUNC(_applySectionPriority);
};

PV(_sectind) = _i;




PV(_ents) = (GVAR(Sections) select _sectind) select SECT__ENTRIES;







_i = -1;

{
	if (_x select ENTRY__PARAMID == _varname) exitWith
	{
		_i = _forEachIndex;
	};
} forEach _ents;

if (_i >= 0 && 
	{([_sortstr, (_ents select _i) select ENTRY__SORTSTR] call CFUNC(_CompareSortingArray)) != 0}) then 
{ // need to find new place - deleting existing entry
	_ents deleteAt _i;
	_i = -1;
};


if (_i < 0) then
{// finding new place
	_i = 0;
	PV(_cnt) = count _ents;
	
	while {_i < _cnt && 
		{ ([ _sortstr, ((_ents select _i) select ENTRY__SORTSTR) ] call CFUNC(_CompareSortingArray) ) > -1}} do
	{
		_i = _i + 1;
	};
	
	PV(_j) = _cnt;
	while {_j > _i} do
	{
		_ents set [_j, _ents select (_j - 1)];
		_j = _j - 1;
	};
};






PV(_defval) = [];
PV(_defval_exp_defined) = false;

if (!isNil 'GVAR(pendingParameterDefaultValues)') then
{
	PV(_j) = MAP_IKEY(GVAR(pendingParameterDefaultValues), _varname);
	if (_j >= 0) then
	{
		_defval = MAP_IGET(GVAR(pendingParameterDefaultValues), _j);
		_defval_exp_defined = true;

		MAP_IDEL(GVAR(pendingParameterDefaultValues), _j);
	};
};

if (!_defval_exp_defined) then
{
	_defval = [_varname, _valhndparams] call (_valhnd select VALUEHND__READFNC);
};




PV(_entry) = [_varname, _sectind, _sortstr, _valhnd, _typehnd, _typeopt, _defval, _paramdesc, _valhndparams];

_ents set [_i, _entry];

MAP_SET(GVAR(Entries), _varname, _entry);






PV(_pnval) = nil;
if (count _valhnd >= 3) then
{
	PV(_profhnd) = _valhnd select VALUEHND__PROFHND;
	if (count _profhnd >= 2) then
	{
		_pnval = [_varname, _valhndparams] call (_profhnd select PROFHND_READFNC);
	}
	else
	{
		_defval_exp_defined = false;
	};
}
else
{
	_pnval = [_varname] call CFUNC(_readFromProfileNamespace);
};



if (  !(isNil {_pnval}) &&
	{[_pnval, _typeopt] call (_typehnd select TYPEHND__VALIDVALFNC)}  ) then
{
	[_varname, _pnval, _valhndparams] call (_valhnd select VALUEHND__WRITEFNC);
}
else
{
	if (_defval_exp_defined) then
	{
		[_varname, _defval, _valhndparams] call (_valhnd select VALUEHND__WRITEFNC);
	};
};
