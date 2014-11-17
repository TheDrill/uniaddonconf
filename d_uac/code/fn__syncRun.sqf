#include "addon.hpp"
#include "main.hpp"


//
//
//  Manages adding the function call to syncRun queue
//  Returns true if queueing was done, false if running function from
// syncRunThread.
//
//  Should be run like this:
//    if ([cur_func, _this] call CFUNC(syncRun)) exitWith {};
//
//


if (isNil 'GVAR(syncRunThread_Active)') then
{
	if (isNil 'GVAR(syncRun_queue)') then
	{
		GVAR(syncRun_queue) = [];
	};

	[] call CFUNC(_syncRunThread);
};


if (isNil '___syncRunThread___') then
{
	GVAR(syncRun_queue) pushBack [_this select 0, +(_this select 1)];
	
	true;
}
else
{
	false;
};
