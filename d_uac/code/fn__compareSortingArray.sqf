#include "addon.hpp"

PV(_s1) = _this select 0;
PV(_s2) = _this select 1;

PV(_c1) = count _s1;
PV(_c2) = count _s2;

PV(_i) = 0;


while {true} do 
{
	if (_i == _c1) exitWith {if (_i == _c2) then {0} else {-1};};
	if (_i == _c2) exitWith {1};
	
	if (_s1 select _i < _s2 select _i)  exitWith {-1};
	if (_s1 select _i > _s2 select _i)  exitWith {1};
	
	_i = _i + 1;
};
