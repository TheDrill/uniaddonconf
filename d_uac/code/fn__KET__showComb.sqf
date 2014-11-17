#include "addon.hpp"
#include "structures.hpp"

// Value structure: [key code, shift state, ctrl state, alt state]


PV(_val) = _this;

if (_val select 0 <= 0) then
{
	localize "STR_Addons__d_uac__KET_None";
}
else
{

	PV(_shift) = "";
	if (_val select 1 && !((_val select 0) in [0x2A, 0x36])) then
	{
		_shift = "Shift + ";
	};

	PV(_ctrl) = "";
	if (_val select 2 && !((_val select 0) in [0x1D, 0x9D]) ) then
	{
		_ctrl = "Ctrl + ";
	};

	PV(_alt) = "";
	if (_val select 3 && !((_val select 0) in [0x38, 0xB8])) then
	{
		_alt = "Alt + ";
	};

	PV(_key) = keyName (_val select 0);

	format["%1%2%3%4", _shift, _ctrl, _alt, _key];
};












/*
if (count GVAR(KET__val) == 4) then
{
	PV(_shift) = "";
	if (GVAR(KET__val) select 1) then
	{
		_shift = "SHIFT";
	};

	PV(_ctrl) = "";
	if (GVAR(KET__val) select 2) then
	{
		_ctrl = "CTRL";
	};

	PV(_alt) = "";
	if (GVAR(KET__val) select 3) then
	{
		_alt = "ALT";
	};
	
	((uiNamespace getVariable 'GVAR(ValueEditDialog_Display)') displayCtrl 101)
		ctrlSetStructuredText  
			parseText format["<t align='left'>%1</t>" + "<t align='center'>%2</t>" +
				"<t align='right'>%3</t>" + "<br/><t align='center'>%4</t>", 
				_shift, _ctrl, _alt, 
				[] call compile ((keyName (GVAR(KET__val) select 0)) call CFUNC(_ReformatForStructuredText))];
	
};
*/
