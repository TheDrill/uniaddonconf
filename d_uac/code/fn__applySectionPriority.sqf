#include "addon.hpp"
#include "main.hpp"

// arguments: ["Section name", priority number, index of existing section entry (or -1 if there's no such entry)]
	
	

PV(_sectname) = _this select 0;
PV(_prio) = _this select 1;
PV(_i) = _this select 2;






PV(_sect) = [];

PV(_need_find_new_place) = true;

if (_i == -1) then // adding new section
{
	_sect = [_sectname, _prio, []];	
}
else
{ // moving existing
	
	
	_sect = GVAR(Sections) select _i;
	if ((_sect select SECT__PRIORITY) != _prio) then
	{
		_sect set [SECT__PRIORITY, _prio];
		GVAR(Sections) deleteAt _i;
	}
	else
	{
		_need_find_new_place = false; // section has the same priority - no need to do anything
	};
};


if (_need_find_new_place) then
{
	// finding new place for section according to its priority


	PV(_cnt) = count GVAR(Sections);
	_i = 0;

	while {_i < _cnt && {_prio <= (GVAR(Sections) select _i) select SECT__PRIORITY}} do {_i = _i + 1;};


	if (_i < _cnt) then 
	{ // inserting
		PV(_j) = _cnt;
		
		while {_j > _i} do
		{
			GVAR(Sections) set [_j, GVAR(Sections) select (_j - 1)];
			_j = _j - 1;
		};
		
	};
	
	GVAR(Sections) set [_i, _sect];
};

_i // returning new section index
