#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_registerProcedure
//
//  Description:
//    This function register procedure pseudo-parameter to UAC. That kind parameters don't have 
//   value, however they execute predefined command when are clicked
//
//  Arguments:
//    0:(str) Parameter name --- unique parameter name.
//    1:(str) Section --- this is section name in which the parameter would appear.
//        If section with such name doesn't exist, it would be created.
//    2:(str) Variable description --- the procedure name which would be displayed to the user.
//    3:(str) Sorting string --- this is string which is used to sort parameters in the list.
//        Its main purpose is to group parameters of the same addon together. If several 
//        parameters have the same sorting string, then they would persist the order in which
//        they were registered. The most common way to fill in this argument is just pass
//        your addon's name.
//    4:(func) Function to execute --- the code which would be executed when parameter is clicked.
//        If this code creates dialog, it shouldn't end before the dialog is closed (and UAC menu
//        is active again).
//    5:() Arguments for the function (default=[]) --- optional arguments which would be 
//        passed to the function
//
//  Return value:
//    None
//
//
//  Examples:
//    1) 
//      ["make_it_good", "My section" "MyAddonID", "Make it good", {hint "It's good now!"}] call d_uac_fnc_registerProcedure;
//
//





if (count _this >= 6) then
{
	[_this select 0, _this select 1, _this select 2, _this select 3, [{[]}, {[]}, []],
		CFUNC(type_procedure), [_this select 4, _this select 5] ]
			call CFUNC(registerParameter);
}
else
{
	[_this select 0, _this select 1, _this select 2, _this select 3, [{[]}, {[]}, []],
		CFUNC(type_procedure), [_this select 4, []] ]
			call CFUNC(registerParameter);	
};
