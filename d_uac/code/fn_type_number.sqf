#include "addon.hpp"
#include "structures.hpp"

//
//  d_uac_fnc_type_number
//
//  Description:
//    This function defines numeric type of parameters. Its only purpose is to return
//    array of handler functions to be used in functions registerVariable or registerParameter.
//    The possible values of parameters with such type are any number. More constraints on 
//    possible values of the number could be defined through transformation function (see 
//    the last argument of function registerNumberVariable)
//  
//  Arguments:
//    None
//
//  Return value:
//    [desc_fnc, change_fnc, compare_fnc, valid_val_fnc]
//












// Arguments when registering:
//
// Value structure: value

if (isNil 'GVAR(NumberType)') then
{
	PV(_descf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
			
		
		[_darr select 0, str _val];
	};
	
	PV(_chgf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		PV(_defval) = _this select 3;
		
		if (count _args == 0) then
		{
			_args = [{_this select 0;}];
		};
		
		
		GVAR(ED__dialogIsShown) = true;
		GVAR(ED__val_type) = 0; // 0 - cancel, 1 - default, 2 - new
		GVAR(ED__new_val_ind) = 0;
					
		createDialog "Addons__d_uac_NumberType_Edit";
		
		ctrlSetText [501, _darr select 0];
		ctrlSetText [502, format[localize 'STR_Addons__d_uac__ED_CurrentValue', str _val]];
		ctrlSetText [503, format[localize 'STR_Addons__d_uac__ED_DefaultValue', str _defval]];
			
		waitUntil {!GVAR(ED__dialogIsShown)};

		if (GVAR(ED__val_type) == 0) exitWith
		{
			_val;
		};
		if (GVAR(ED__val_type) == 1) exitWith
		{
			[parseNumber GVAR(ED__new_val)] call (_args select 0);
		};
		if (GVAR(ED__val_type) == 2) exitWith
		{
			_defval;
		};
	};
	
	PV(_cmpf) = 
	{
		PV(_val1) = _this select 0;
		PV(_val2) = _this select 1;
		
		_val1 isEqualTo _val2;
	};
	
	PV(_validf) =
	{
		PV(_val) = _this select 0;
		if (typeName _val != "SCALAR") exitWith {false;};
		
		if (count (_this select 1) == 0) then
		{
			true;
		}
		else
		{
			PV(_tfnc) = (_this select 1) select 0;
			
			_t = [_val] call _tfnc;
			_val == _t;
		};
	};
	
	GVAR(NumberType) = [_descf, _chgf, _cmpf, _validf];

};

GVAR(NumberType);
