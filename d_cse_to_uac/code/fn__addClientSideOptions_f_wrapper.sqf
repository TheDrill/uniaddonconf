#include "addon.hpp"

PV(_name) = _this select 0;
PV(_pvals) = + (_this select 1);
//PV(_val) = _this select 2;
//PV(_onChange) = _this select 3;

for "_i" from 0 to ((count _pvals) - 1) do
{
	_pvals set [_i, [_pvals select _i, _i]];	
};


missionNamespace setVariable ['GVAR(_o_)' + _name, [_pvals]];

_this call CFUNC(_CSE_addClientSideOptions_f);
