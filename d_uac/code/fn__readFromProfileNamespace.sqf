#include "addon.hpp"
#include "main.hpp"

//
//  Arguments: [variable to get]
//
//  Returns it value of nil if there's no such variable
//

PV(_id) = _this select 0;

PV(_pft) = profileNamespace getVariable PROFILENAMESPACE_VARIABLENAME;

if (isNil {_pft} || {typeName _pft != "ARRAY" || {count _pft != 2}}) then
{
	_pft = CREATE_MAP();
	profileNamespace setVariable [PROFILENAMESPACE_VARIABLENAME, _pft];
};




MAP_GET(_pft, _id);
