#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_registerKeyBindingVariable
//
//  Description:
//    This function register given keybinding variable (from missionNamespace) to the UniAddonConf
//    system. Keybinding format used in UniAddonConf is: [key_code, shift_state, ctrl_state, alt_state].
//    Here key_code is DIK code, shift_state/ctrl_state/alt_state --- booleans (true/false).
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
//      my_keybinding = [24, false, true, false]; // Ctrl + O
//      ["My section", "my_keybinding", "MyAddonID", "Open door keybinding"] call d_uac_fnc_registerKeyBindingVariable;
//
//






//
// This is just a wrapper function for RegisterVariable (uses type d_uac_fnc_type_keyBinding)
//
// Arguments:  [ "Section", "variable name", "sorting string", "description" ]
//


[_this select 0, _this select 1, _this select 2, _this select 3, 
	CFUNC(type_keyBinding), []] call CFUNC(RegisterVariable);
