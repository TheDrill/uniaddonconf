#include "addon.hpp"
#include "structures.hpp"

//
//  d_uac_fnc_type_enum
//
//  Description:
//    This function defines enum type of parameters. Its only purpose is to return
//    array of handler functions to be used in functions registerVariable or registerParameter.
//    The possible values of parameters with such type explicitly defined by user.
//  
//  Arguments:
//    None
//
//  Return value:
//    [desc_fnc, change_fnc, compare_fnc, valid_val_fnc]
//











#define XOR(x,y) (((x)||(y)) && !((x)&&(y)))


// Arguments when registering:
//
// Value structure: value

if (isNil 'GVAR(EnumType)') then
{
	PV(_descf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		
		PV(_enum_vals) = _args select 0;
		
		PV(_str) = "!WRONG VALUE!";
		{
			if ((_x select 1) isEqualTo _val) exitWith
			{
				_str = _x select 0;
			};
		} forEach _enum_vals;
	
		
		[_darr select 0, _str];
	};
	
	PV(_chgf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		PV(_defval) = _this select 3;
		
		PV(_enum) = _args select 0;
		PV(_enum_len) = count _enum;
		
		PV(_val_ind) = 0;
		{
			if (_val isEqualTo (_x select 1)) exitWith {_val_ind = _forEachIndex;};
		} forEach _enum;
		
		PV(_def_val_str) = "!WRONG VALUE!";
		{
			if (_defval isEqualTo (_x select 1)) exitWith{_def_val_str = _x select 0;};
		} forEach _enum;
		
		if (_args select 1) then // dialogless mode --- cycle value
		{
			_val_ind = (_val_ind + 1) % _enum_len;
			(_enum select _val_ind) select 1;
		}
		else // dialog mode --- show dialog to choose the value from list.
		{
			GVAR(ED__dialogIsShown) = true;
			GVAR(ED__val_type) = 0; // 0 - cancel, 1 - default, 2 - new
			GVAR(ED__new_val_ind) = 0;
						
			createDialog "Addons__d_uac_EnumType_Edit";
			
			ctrlSetText [501, _darr select 0];
			ctrlSetText [502, format[localize 'STR_Addons__d_uac__ED_CurrentValue', (_enum select _val_ind) select 0]];
			ctrlSetText [503, format[localize 'STR_Addons__d_uac__ED_DefaultValue', _def_val_str]];
		
			
			{
				lbAdd [101, _x select 0];
			} forEach _enum;
			lbSetCurSel [101, _val_ind];
			
			waitUntil {!GVAR(ED__dialogIsShown)};

			if (GVAR(ED__val_type) == 0) exitWith
			{
				_val;
			};
			if (GVAR(ED__val_type) == 1) exitWith
			{
				(_enum select GVAR(ED__new_val_ind)) select 1;
			};
			if (GVAR(ED__val_type) == 2) exitWith
			{
				_defval;
			};
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
		PV(_enum) = (_this select 1) select 0;
		
		PV(_rv) = false;
		{
			if (_val isEqualTo (_x select 1)) exitWith {_rv = true;}
		} forEach _enum;
		
		_rv;
	};
	
	GVAR(EnumType) = [_descf, _chgf, _cmpf, _validf];

};

GVAR(EnumType);
