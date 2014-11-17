#include "addon.hpp"
#include "structures.hpp"


//
//  d_uac_fnc_showConfigDialog
//
//  Description:
//    This function could be run to show UniAddonConf configuration dialog, though it normally is
//    not needed because there's button in in-game menu to call it.
//  
//  Arguments:
//    None
//
//  Return value:
//    None
//






if ((!(missionNamespace getVariable ['GVAR(Initialized)', false])) || 
	{ (missionNamespace getVariable ['GVAR(dialogIsShown)', false]) ||
	{(count GVAR(Sections)) == 0} }) 
		exitWith {};


GVAR(dialogIsShown) = true;
GVAR(pendingValues) = [];

createDialog "Addons__d_uac_ConfigDialog";



// Fill sections
PV(_i) = 0;
{
	lnbAddRow [SECT_LISTBOX_IDC, [_x select SECT__SECTNAME]];
	
	
	lbSetTooltip [SECT_LISTBOX_IDC, _i, _x select SECT__SECTNAME];
	
	_i = _i + 1;
} forEach GVAR(Sections);



lnbSetCurSelRow [SECT_LISTBOX_IDC, 0];
