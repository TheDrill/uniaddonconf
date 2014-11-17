#include "addon.hpp"
#include "main.hpp"

//
//  d_uac_fnc_doesParameterExist
//
//  Description:
//    Checks if the parameter exists in the system
//
//  Arguments:
//    0:(str) Parameter id --- parameter's id.
//
//  Return value:
//    True if parameter was found, false otherwise
//
//
//  Examples:
//    1) 
//      ["my_option"] call d_uac_fnc_doesParameterExist
//
//



[] call CFUNC(_initUAC);



PV(_paramid) = _this select 0;

MAP_IKEY(GVAR(Entries), _paramid) >= 0;
