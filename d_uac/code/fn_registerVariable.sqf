#include "addon.hpp"
#include "main.hpp"


//
//  d_uac_fnc_registerVariable
//
//  Description:
//    This function registers the variable as parameter of UniAddonConf and sets its type.
//    The function reads variables's current value and treats it as default value. It then restores
//    the value saved in user profile.
//
//  Arguments:
//    0:(str) Variable name --- this is variable name (from missionNamespace), which should be
//        registered to the system. UniAddonConf would read default value of parameter from the
//        variable, then change its value to the one, stored in profile. If parameter value
//        changes, UniAddonConf would save the new value to the variable automatically.
//    1:(str) Section --- section name in which the parameter would appear. If section with such name 
//        doesn't exist, it would be created.
//    2:(str) Variable description --- the parameter name which would be displayed to the user
//    3:(str) Sorting string --- this is string which is used to sort parameters in the list.
//        Its main purpose is to group parameters of the same addon together. If several 
//        parameters have the same sorting string, then they would persist the order in which
//        they were registered. The most common way to fill in this argument is just pass
//        your addon's name.
//    4:(fnc) Type handlers --- function which returns array of four functions 
//        [desc_fnc, change_fnc, compare_fnc, valid_val_fnc] which fully describe and handle the parameter
//        type. 
//		  Functions descriptions:
//          desc_fnc --- receives [type_arguments_array, value] as argument and should return user-friendly
//            string representing the parameter value
//          change_fnc --- receives [type_arguments_array, value, default_value] as argument and should handle
//            creating the dialog window for user to assign new value of parameter and return the new value
//          compare_fnc --- receives [value_1, value_2] as argument and returns true if the parameters are equal and
//            false otherwise.
//          valid_val_fnc --- receives [value] as argument and returns true if the argument is correct value for the 
//            type and false otherwise
//		  There're several predefined types in UniAddonConf: 
//          1. d_uac_fnc_type_boolean --- defines boolean-type parameters.
//          2. d_uac_fnc_type_KeyBinding --- defines key binding parameters.
//    5:(array) Type arguments --- array of additional type-specific arguments.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      my_keybinding = [24, false, true, false]; // Ctrl + O
//      ["My section", "my_keybinding", "MyAddonID", ["Open door keybinding"], d_uac_fnc_type_keyBinding] call d_uac_fnc_registerVariable;
//
//







//
// This is just a wrapper function for RegisterParameter (doesn't need value handlers, reads directly from variable instead)
//
// Arguments:  [ "Section", "variable name", "sorting string", parameter type options (description, etc), parameter type (3 handling functions) ]
//

if (isNil 'GVAR(RegisterVariable_ValueHnd)') then
{
	PV(_readf) =
	{
		missionNamespace getVariable (_this select 0);		
	};
	
	PV(_writef) =
	{
		missionNamespace setVariable [_this select 0, _this select 1];
	};
	
	GVAR(RegisterVariable_ValueHnd) = [_readf, _writef];
};

[_this select 0, _this select 1, _this select 2, _this select 3, GVAR(RegisterVariable_ValueHnd), _this select 4, _this select 5] call
	CFUNC(RegisterParameter);
