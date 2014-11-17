#include "addon.hpp"
#include "main.hpp"

// exitcode == 1  --- OK
// exitcode == 2  --- Cancel
PV(_exitcode) = (_this select 1);

//hint str _exitcode;

GVAR(dialogIsShown) = false;


PV(_sectind) = -1;
PV(_entind) = -1;
PV(_ent) = [];
PV(_need_to_save) = false;

if (_exitcode == 1) then
{
	{
		if (!isNil {_x}) then
		{
			_sectind = _forEachIndex;
			{
				if (!isNil {_x}) then
				{
					_entind = _forEachIndex;
					_ent = ((GVAR(Sections) select _sectind) select SECT__ENTRIES) select _entind;
					
					[_ent select ENTRY__PARAMID, _x, _ent select ENTRY__VALUEHNDPARAMS] call ((_ent select ENTRY__VALUEHND) select VALUEHND__WRITEFNC);
					
					if (count (_ent select ENTRY__VALUEHND) >= 3) then
					{
						PV(_profhnd) = (_ent select ENTRY__VALUEHND) select VALUEHND__PROFHND;
						if (count _profhnd >= 2) then
						{
							[_ent select ENTRY__PARAMID, _x, _ent select ENTRY__VALUEHNDPARAMS] call (_profhnd select PROFHND_WRITEFNC); 
						};
					}
					else
					{
						if ([_x, _ent select ENTRY__DEFAULT_VALUE, _ent select ENTRY__TYPEOPT] call 
							((_ent select ENTRY__TYPEHND) select TYPEHND__COMPAREFNC)) then
						{
							[_ent select ENTRY__PARAMID, nil] call CFUNC(_writeToProfileNamespace);
						}
						else
						{
							[_ent select ENTRY__PARAMID, _x] call CFUNC(_writeToProfileNamespace);
						};
					};
					
					_need_to_save = true;
				};
				
			} forEach _x;
		};
		
	} forEach GVAR(pendingValues);
	
};

GVAR(pendingValues) = [];


if (_need_to_save) then
{
	saveProfileNamespace;	
};
