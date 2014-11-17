#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_registerNumberVariable
//
//  Description:
//    This function register given numeric variable (from missionNamespace) to the UniAddonConf
//    system. The possible values of variable is any scalar number.
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
//    4:(func) Number transformation (default={_this select 0}) --- a function which transforms
//        given number to a nearest appropriate value. For example, if the parameter should be
//        only integer, then this function must convert any float number to integer (by floor,
//        for example).
//
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      my_num = 5;
//      ["my_num", "My section" "MyAddonID", "Ammo count"] call d_uac_fnc_registerNumberVariable;
//
//






if (count _this >= 5) then
{
	[_this select 0, _this select 1, _this select 2, 
		_this select 3, CFUNC(type_number), [_this select 4]]
			call CFUNC(RegisterVariable);
}
else
{
	[_this select 0, _this select 1, _this select 2, 
		_this select 3, CFUNC(type_number), [{_this select 0;}]] 
			call CFUNC(RegisterVariable);
};
