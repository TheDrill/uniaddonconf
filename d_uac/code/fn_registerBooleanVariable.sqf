#include "addon.hpp"
#include "main.hpp"


//
//  d_uac_fnc_registerBooleanVariable
//
//  Description:
//    This function register given boolean variable (from missionNamespace) to the UniAddonConf
//    system.
//
//  Arguments:
//    0:(str) Variable name --- this is variable name (from missionNamespace), which should be
//        registered to the system. UniAddonConf would read default value of parameter from the
//        variable, then change its value to the one, stored in profile. If parameter value
//        changes, UniAddonConf would save the new value to the variable automatically.
//    1:(str) Section --- this is section name in which the parameter would appear.
//        If section with such name doesn't exist, it would be created.
//    2:(str) Variable description --- the parameter name which would be displayed to the user
//    3:(str) Sorting string --- this is string which is used to sort parameters in the list.
//        Its main purpose is to group parameters of the same addon together. If several 
//        parameters have the same sorting string, then they would persist the order in which
//        they were registered. The most common way to fill in this argument is just pass
//        your addon's name.
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      my_var = true;
//      ["My section", "my_var", "MyAddonID", "Show players nickname"] call d_uac_fnc_registerBooleanVariable;
//
//






//
// This is just a wrapper function for RegisterVariable (uses type d_uac_fnc_type_boolean)
//
// Arguments:  [ "Section", "variable name", "description", "sorting string" ]
//


[_this select 0, _this select 1, _this select 2, _this select 3, CFUNC(type_boolean), []] call
	CFUNC(RegisterVariable);
