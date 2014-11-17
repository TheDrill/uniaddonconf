#include "addon.hpp"
#include "structures.hpp"

//
//  d_uac_fnc_type_keyBinding
//
//  Description:
//    This function defines key binding type of parameters. Its only purpose is to return
//    array of handler functions to be used in functions registerVariable or registerParameter.
//    Variables of such type would have values of kind: 
//      [key_code, shift_state, ctrl_state, alt_state]
//    Here key_code is DIK code; shift_state, ctrl_state, alt_state --- booleans.
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
// Value structure: [key code, shift state, ctrl state, alt state]
// returns key code == 0 if no binding 

if (isNil 'GVAR(KeyEntryType)') then
{
	PV(_descf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		
	
		
		[_darr select 0, _val call CFUNC(_KET__ShowComb)];
	};
	
	PV(_chgf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		PV(_defval) = _this select 3;
		
		
		GVAR(KET__dialogIsShown) = true;
		GVAR(KET__val) = _val;
		createDialog "Addons__d_uac_KeyType_Edit";
		
		ctrlSetText [501, _darr select 0];
		ctrlSetText [502, format[localize 'STR_Addons__d_uac__ED_CurrentValue', _val call CFUNC(_KET__ShowComb)]];
		ctrlSetText [503, format[localize 'STR_Addons__d_uac__ED_DefaultValue', _defval call CFUNC(_KET__ShowComb)]];
		
		
		
		waitUntil {!GVAR(KET__dialogIsShown)};

		if (count GVAR(KET__val) > 0) then
		{
			if ((GVAR(KET__val) select 0) < 0) then
			{
				_defval;
			}
			else
			{
				GVAR(KET__val);
			};
		}
		else
		{
			_val;
		};
	};
	
	PV(_cmpf) = 
	{
		PV(_val1) = _this select 0;
		PV(_val2) = _this select 1;
		
		( (_val1 select 0) == (_val2 select 0) ) &&
			( ({XOR(_val1 select _x, _val2 select _x)} count [1,2,3]) == 0 );
	};
	
	PV(_validf) =
	{
		PV(_val) = _this select 0;
		
		(!isNil {_val}) && {(typeName _val == "ARRAY") && {count _val == 4 && 
				{typeName (_val select 0) == "SCALAR" && typeName (_val select 1) == "BOOL" &&
				 typeName (_val select 2) == "BOOL"   && typeName (_val select 3) == "BOOL"}
			}};
	};
	
	GVAR(KeyEntryType) = [_descf, _chgf, _cmpf, _validf];

};

GVAR(KeyEntryType);
