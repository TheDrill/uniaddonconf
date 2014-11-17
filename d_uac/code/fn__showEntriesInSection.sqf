#include "addon.hpp"
#include "main.hpp"


PV(_sectind) = lnbCurSelRow SECT_LISTBOX_IDC;
PV(_val) = 0;
PV(_pendval) = 0;

PV(_num_entries_before) = lbSize ENT_LISTBOX_IDC;

PV(_i) = 0;
PV(_desc_and_val) = ["",""];
PV(_desc) = "";
PV(_defdesc) = "";
PV(_ent_color) = [];

PV(_set_colors_array) = [];

{
	_val = [_x select ENTRY__PARAMID, _x select ENTRY__VALUEHNDPARAMS] call ((_x select ENTRY__VALUEHND) select VALUEHND__READFNC);
	
	if ([_val, _x select ENTRY__DEFAULT_VALUE, _x select ENTRY__TYPEOPT] call
			((_x select ENTRY__TYPEHND) select TYPEHND__COMPAREFNC)) then
	{
		_ent_color = [];
	}
	else
	{
		_ent_color = ENTRY_COLOR__NOT_DEFAULT;
	};
	
	_pendval = [_sectind, _forEachIndex] call CFUNC(_GetPendingValue);
	
	if (   !( [_val, _pendval, _x select ENTRY__TYPEOPT] call
			((_x select ENTRY__TYPEHND) select TYPEHND__COMPAREFNC) )	) then
	{
		_val = _pendval;
		
		_ent_color = ENTRY_COLOR__CHANGED;
	};
		
	_desc_and_val = [_x select ENTRY__PARAMDESC, _x select ENTRY__TYPEOPT, _val]
		call ((_x select ENTRY__TYPEHND) select TYPEHND__DESCFNC);
		
	_defdesc = ([_x select ENTRY__PARAMDESC, _x select ENTRY__TYPEOPT, 
		_x select ENTRY__DEFAULT_VALUE] call 
		((_x select ENTRY__TYPEHND) select TYPEHND__DESCFNC)) select 1;
	
	
	_desc = toArray (_desc_and_val select 0);
	if (count _desc > 37) then
	{
		_desc resize 35;
		_desc = _desc + (toArray "...");
	};
	lnbAddRow [ENT_LISTBOX_IDC, [toString _desc, _desc_and_val select 1]];	
	
	
	
	lbSetTooltip [ENT_LISTBOX_IDC, _num_entries_before + _i, 
		format ['%1 (%2) = %3 (def. %4)', _x select ENTRY__PARAMID, _desc_and_val select 0, _desc_and_val select 1, _defdesc] ];
	
	
	if (count _ent_color > 0) then
	{
		_set_colors_array pushBack [ENT_LISTBOX_IDC, [_i, 1], _ent_color];
		
	};
		
	_i = _i + 1;
		
} forEach ((GVAR(Sections) select _sectind) select SECT__ENTRIES);

while {_num_entries_before > 0} do
{
	lbDelete [ENT_LISTBOX_IDC, 0];
	_num_entries_before = _num_entries_before - 1;
};

{
	lnbSetColor _x;
} forEach _set_colors_array;
