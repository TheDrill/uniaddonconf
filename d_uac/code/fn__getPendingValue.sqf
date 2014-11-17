#include "addon.hpp"
#include "main.hpp"

PV(_sectind) = _this select 0;
PV(_entind) = _this select 1;

PV(_ent) = ((GVAR(Sections) select _sectind) select SECT__ENTRIES) select _entind;

PV(_val) = [_ent select ENTRY__PARAMID, _ent select ENTRY__VALUEHNDPARAMS] call ((_ent select ENTRY__VALUEHND) select VALUEHND__READFNC);

if (CHECK_INDEX(_sectind, GVAR(pendingValues)) && {
	!isNil {GVAR(pendingValues) select _sectind} && {
	
	CHECK_INDEX(_entind, GVAR(pendingValues) select _sectind) && {
	!isNil {(GVAR(pendingValues) select _sectind) select _entind}
	
	}}}) then
{
	_val = (GVAR(pendingValues) select _sectind) select _entind;
};

_val;
