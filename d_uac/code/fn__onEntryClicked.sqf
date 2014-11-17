#include "addon.hpp"
#include "main.hpp"

_this spawn{
if (!isNil {lnbCurSelRow ENT_LISTBOX_IDC} && {(lnbCurSelRow ENT_LISTBOX_IDC) >= 0}) then
{
	PV(_entind) = lnbCurSelRow ENT_LISTBOX_IDC;
	PV(_sectind) = lnbCurSelRow SECT_LISTBOX_IDC;

	if (_entind < count ((GVAR(Sections) select _sectind) select SECT__ENTRIES)) then
	{
		PV(_ent) = ((GVAR(Sections) select _sectind) select SECT__ENTRIES) select _entind;



		PV(_curval) = [_sectind, _entind] call CFUNC(_GetPendingValue);

		PV(_newval) = [_ent select ENTRY__PARAMDESC, _ent select ENTRY__TYPEOPT,
			_curval, _ent select ENTRY__DEFAULT_VALUE] call
			((_ent select ENTRY__TYPEHND) select TYPEHND__CHANGEFNC);
			
		if (!(  [_curval, _newval, _ent select ENTRY__TYPEOPT] call 
			((_ent select ENTRY__TYPEHND) select TYPEHND__COMPAREFNC)  )) then
		{
			[_sectind, _entind, _newval] call CFUNC(_SetPendingValue);
		};
		
		[] call CFUNC(_showEntriesInSection);

	};
};};
