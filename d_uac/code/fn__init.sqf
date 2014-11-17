#include "addon.hpp"
#include "main.hpp"


[localize "STR_Addons__d_uac_Section_Keys", 100.00001] call CFUNC(setSectionPriority);
[localize "STR_Addons__d_uac_Section_General", 100] call CFUNC(setSectionPriority);

[localize "STR_Addons__d_uac_Section_MissionSpecific", -100] call CFUNC(setSectionPriority);
[localize "STR_Addons__d_uac_Section_Procedures", -101] call CFUNC(setSectionPriority);
