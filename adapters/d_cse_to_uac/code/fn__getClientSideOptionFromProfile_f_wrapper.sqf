#include "addon.hpp"

PV(_name) = _this select 0;
PV(_dv) = _this select 1;


["CSE_o_" + _name, _dv] call d_uac_fnc_setParameterDefaultValue;


_this call CFUNC(_CSE_getClientSideOptionFromProfile_f);
