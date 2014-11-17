#include "addon.hpp"
#include "structures.hpp"

//
//  d_uac_fnc_type_procedure
//
//  Description:
//    This function defines procedure type of parameters. Its only purpose is to return
//    array of handler functions to be used in functions registerVariable or registerParameter.
//    Procedure type of parameters is pseudo-type which has no value and could be used to activate
//    predefined command from menu
//  
//  Arguments:
//    None
//
//  Return value:
//    [desc_fnc, change_fnc, compare_fnc, valid_val_fnc]
//











// Arguments when registering:
//
// Value structure: None

if (isNil 'GVAR(ProcedureType)') then
{
	PV(_descf) = 
	{
		PV(_darr) = _this select 0;	
		PV(_args) = _this select 1;	
		
		[_darr select 0, localize "STR_Addons__d_uac__ProcType_Value"];
	};
	
	PV(_chgf) = 
	{
		PV(_darr) = _this select 0;
		PV(_args) = _this select 1;
		PV(_fnc) = _args select 0;
		PV(_fnc_args) = _args select 1;
		
		_fnc_args call _fnc; 
		
		0;
	};
	
	PV(_cmpf) = 
	{
		true;
	};
	
	PV(_validf) =
	{
		true;
	};
	
	GVAR(ProcedureType) = [_descf, _chgf, _cmpf, _validf];

};

GVAR(ProcedureType);
