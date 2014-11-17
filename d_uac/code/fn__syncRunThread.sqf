#include "addon.hpp"
#include "main.hpp"


[] spawn
{
	if (isNil 'GVAR(syncRunThread_Active)') then
	{
		GVAR(syncRunThread_Active) = true;
		
		if (isNil 'GVAR(syncRun_queue)') then
		{
			GVAR(syncRun_queue) = [];
		};
		
		waitUntil
		{
			___syncRunThread___ = true;
			
			while {!(missionNamespace getVariable['GVAR(dialogIsShown)', false]) &&
				{
					(count GVAR(syncRun_queue)) > 0
				}} do
			{
				PV(_func_and_args) = GVAR(syncRun_queue) deleteAt 0;
			
				(_func_and_args select 1) call (_func_and_args select 0);
			};
			
			false;
		};
	};	
};
