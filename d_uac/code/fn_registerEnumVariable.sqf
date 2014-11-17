#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_registerEnumVariable
//
//  Description:
//    This function register given enum variable (from missionNamespace) to the UniAddonConf
//    system. The possible values of variable and their labels are specified by user.
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
//    4:(array) Enum specification --- array of pairs [value label, value]. For example:
//        [["One", 1], ["Two", 2], ["None", nil]]
//    5:(bool) dialogless mode (default=false) --- turn on dialogless mode (no dialog shown,
//        value is cyclicly changed)
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      my_enum = 1;
//      ["my_enum", "My section" "MyAddonID", "Color of unit", [["Red", 1], ["Green", 2]]] call d_uac_fnc_registerEnumVariable;
//
//






[_this select 0, _this select 1, _this select 2, 
	_this select 3, CFUNC(type_enum), 
	[_this select 4, (count _this >= 6) && {_this select 5}]] call CFUNC(RegisterVariable);
