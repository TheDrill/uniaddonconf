#include "addon.hpp"
#include "main.hpp"


//
//  d_uac_fnc_setSectionPriority
//
//  Description:
//    This function might be used to change the order of sections in the GUI list. Default priority
//  of section is 0. More positive values correspond to upper position in the list, negative --- to lower.
//
//  Arguments:
//    0:(str) Section --- section name to change priority for. Section may not exist at the moment of changing its priority --- then the priority would actually be applied as section being created.
//    1:(float) Priority --- new value priority for the section.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      ["My section", 100] call d_uac_fnc_setSectionPriority;
//




//  Run function in synchronized environment

if ([CFUNC(setSectionPriority), _this] call CFUNC(_syncRun)) exitWith {};

[] call CFUNC(_initUAC);
	
	
	

PV(_sectname) = _this select 0;
PV(_prio) = _this select 1;






PV(_i) = -1;

{
	if (_x select SECT__SECTNAME == _sectname) exitWith
	{
		_i = _forEachIndex;
	};
} forEach GVAR(Sections);

if (_i == -1) then // no such section yet, add to pending section priority array
{
	if (isNil 'GVAR(pendingSectionPriorities)') then
	{
		GVAR(pendingSectionPriorities) = [[_sectname, _prio]];
	}
	else
	{
		// check if there already entry for current _sectname
		_i = -1;
		{
			if (_x select 0 == _sectname) exitWith
			{
				_i = _forEachIndex;
			};
		} forEach GVAR(pendingSectionPriorities);
		
		if (_i == -1) then
		{
			_i = count GVAR(pendingSectionPriorities);
		};
		
		GVAR(pendingSectionPriorities) set [_i, [_sectname, _prio]];
	};
	
}
else
{ // there's section entry - apply new priority right now
	[_sectname, _prio, _i] call CFUNC(_applySectionPriority);
};
