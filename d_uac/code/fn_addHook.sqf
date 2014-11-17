#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_addHook
//
//  Description:
//    Adds hook to some of predefined functions. The hook here is a function which 
//   would receive the arguments of a function (registerParameter) and has a change
//   to change the arguments or cancel the function call. The hooking feature in UAC
//   is intended for easy manipulation on menu organization. The one can easly rename
//   parameters, change their section, default value, totaly remove it and so on.
//    Currently it is possible to hook to:
//      d_uac_fnc_registerParameter
//
//    Let note that registerParameter is the root function for adding
//   parameters and thus adding hook to it would also allow to manipulate the calls to 
//   functions like registerVariable, registerBooleanVariable, registerKeyBindingVariable
//   and so on. The best place to use addHook is in some preinit event.
//    The hooks should be used only when the one has an addon pack and wants to 
//   reorganize their parameters to form a consistent menu without editing the
//   original addons. Use with caution.
//
//
//  Arguments:
//    0:(str) function name --- short function name to add hook to. Possible values are:
//        1. "registerParameter".
//    1:(fnc) function code for hook  --- the function which would be called for as a hook
//      for manipulating the agruments. It would receive array [hook_id, _fthis] as argument,
//      where:
//        hook_id --- id of the hook, which could be used to remove the hook 
//        _fthis --- the reference to original _this variable of corresponding function.
//          The one should change its element through set command for manipulating 
//          the arguments of the hooked function.
//      The function must return -1, 0. Here -1 means to cancel the function call,
//      0 --- to continue the function call (with possibly changed arguments)
//
//  Return value:
//    (int) hook id --- could be used to delete the hook later
//
//
//  Examples:
//    1) Move all parameters from section "Addon section" to "My section"
//      _hook_id = ["registerParameter",{
//        private ["_t"];
//        _t = _this select 1;
//        if (_t select 1 == "Addon section") then
//        {
//          _t set [1, "My section"];
//          -1;
//        }
//        else
//        {
//          0;
//        };
//      }] call d_uac_fnc_addHook
//
//

PV(_fname) = _this select 0;
PV(_fnc) = _this select 1;

// init hook ids counter
if (isNil 'GVAR(Hook_id)') then
{
	GVAR(Hook_id) = 0;
};

// init hooks list
if (isNil ('GVAR(Hooks__)' + _fname)) then
{
	missionNamespace setVariable ['GVAR(Hooks__)' + _fname, []];
};

PV(_t) = missionNamespace getVariable ['GVAR(Hooks__)' + _fname, []];

GVAR(Hook_id) = GVAR(Hook_id) + 1;

PV(_ti) = GVAR(Hook_id);
_t pushBack [_ti, _fnc];

_ti;
