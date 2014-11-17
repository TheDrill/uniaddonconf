#include "addon.hpp"
#include "main.hpp"


if (!(missionNamespace getVariable ['GVAR(Initialized)', false])) then
{
	GVAR(Sections) = [];
	GVAR(Entries) = CREATE_MAP();
	GVAR(Initialized) = true;
};
