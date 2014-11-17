#include "addon.hpp"
#include "main.hpp"

PV(_sectind) = _this select 0;
PV(_entind) = _this select 1;
PV(_newval) = _this select 2;



if (!CHECK_INDEX(_sectind, GVAR(pendingValues)) ||
	{ isNil { GVAR(pendingValues) select _sectind} }) then
{
	GVAR(pendingValues) set [_sectind, []];
};

(GVAR(pendingValues) select _sectind) set [_entind, _newval];
