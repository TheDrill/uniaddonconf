#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_deleteParameter
//
//  Description:
//    Function deletes parameter if it exists in the system
//
//  Arguments:
//    0:(str) Parameter id --- parameter's id to be deleted.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      ["my_option"] call d_uac_fnc_deleteParameter
//
//





//  Run function in synchronized environment
if ([CFUNC(deleteParameter), _this] call CFUNC(_syncRun)) exitWith {};

[] call CFUNC(_initUAC);





PV(_paramid) = _this select 0;




PV(_i) = MAP_IKEY(GVAR(Entries), _paramid);

if (_i >= 0) then
{
	_ent = MAP_IGET(GVAR(Entries), (_i));
	
	PV(_sect) = GVAR(Sections) select (_ent select ENTRY__SECTION);
	PV(_sents) = _sect select SECT__ENTRIES;
	
	if (count _sents <= 1) then
	{
		PV(_sectname) = _sect select SECT__SECTNAME;
		
		{
			if ((_x select SECT__SECTNAME) == _sectname) exitWith
			{
				GVAR(Sections) deleteAt _forEachIndex;
			};				
		} forEach GVAR(Sections);
	}
	else
	{
		{
			if ((_x select ENTRY__PARAMID) == _paramid) exitWith
			{
				_sents deleteAt _forEachIndex;
			};
		} forEach _sents;
	};
	


	MAP_IDEL(GVAR(Entries), _i);
};
