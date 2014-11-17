#include "addon.hpp"
#include "main.hpp"

//
//  Arguments: [variable to set, value to set]
//
//  Returns none
//

PV(_id) = _this select 0;
PV(_val) = _this select 1;

PV(_pft) = profileNamespace getVariable PROFILENAMESPACE_VARIABLENAME;

if (isNil {_pft} || {typeName _pft != "ARRAY" || {count _pft != 2}}) then
{
	_pft = CREATE_MAP();
	profileNamespace setVariable [PROFILENAMESPACE_VARIABLENAME, _pft];
};


if (isNil {_val}) then
{
	MAP_DEL(_pft, _id);
}
else
{
	MAP_SET(_pft, _id, _val);
};

