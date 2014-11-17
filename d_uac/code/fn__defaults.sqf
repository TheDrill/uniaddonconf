#include "addon.hpp"
#include "main.hpp"


PV(_cur_section) = _this select 0;


if (!_cur_section) then
{
	PV(_sectind) = 0;
	PV(_entind) = 0;
	
	{
		_entind = 0;
		
		{
			if (!( [ [_x select ENTRY__PARAMID, _x select ENTRY__VALUEHNDPARAMS] call ((_x select ENTRY__VALUEHND) select VALUEHND__READFNC)
				  , _x select ENTRY__DEFAULT_VALUE, _x select ENTRY__TYPEOPT ] call ((_x select ENTRY__TYPEHND) select TYPEHND__COMPAREFNC))) then
			{
				[_sectind, _entind, _x select ENTRY__DEFAULT_VALUE] call CFUNC(_SetPendingValue);
			};
			
			
			
			_entind = _entind + 1;
		} forEach (_x select SECT__ENTRIES);
		
		
		_sectind = _sectind + 1;
	} forEach GVAR(Sections);
	
}
else
{
	PV(_sectind) = lnbCurSelRow SECT_LISTBOX_IDC;
	PV(_entind) = 0;
		
	{
		if (!( [ [_x select ENTRY__PARAMID, _x select ENTRY__VALUEHNDPARAMS] call ((_x select ENTRY__VALUEHND) select VALUEHND__READFNC)
			  , _x select ENTRY__DEFAULT_VALUE, _x select ENTRY__TYPEOPT ] call ((_x select ENTRY__TYPEHND) select TYPEHND__COMPAREFNC))) then
		{
			[_sectind, _entind, _x select ENTRY__DEFAULT_VALUE] call CFUNC(_SetPendingValue);
		};
		
		
		
		_entind = _entind + 1;
	} forEach ((GVAR(Sections) select _sectind) select SECT__ENTRIES);
};

[] call CFUNC(_showEntriesInSection);
