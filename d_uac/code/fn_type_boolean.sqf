#include "addon.hpp"
#include "structures.hpp"



//
//  d_uac_fnc_type_boolean
//
//  Description:
//    This function defines boolean type of parameters. Its only purpose is to return
//    array of handler functions to be used in functions registerVariable or registerParameter.
//    Variables of such type would have values of kind true/false.
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
// Value structure: boolean
//

if (isNil 'GVAR(BooleanType)') then
{
	PV(_descf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		
		PV(_valdesc) = localize "STR_Addons__d_uac__BT_False";
		
		if (_val) then
		{
			_valdesc = localize "STR_Addons__d_uac__BT_True";
		};
		
		[_darr select 0, _valdesc];
	};
	
	PV(_chgf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_val) = _this select 2;
		PV(_defval) = _this select 3;
		
		
		if (_val) then
		{
			false;
		}
		else
		{
			true;
		};
	};
	
	PV(_cmpf) = 
	{
		PV(_val1) = _this select 0;
		PV(_val2) = _this select 1;
		
		!XOR(_val1, _val2);
	};
	
	PV(_validf) =
	{
		PV(_val) = _this select 0;
		
		(!isNil {_val}) && {(typeName _val == "BOOL")};
	};
	
	GVAR(BooleanType) = [_descf, _chgf, _cmpf, _validf];

};

GVAR(BooleanType);
