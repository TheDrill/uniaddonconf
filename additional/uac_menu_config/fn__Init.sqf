
_keys_to_hide = [
	"AGM_Key_openInteractionMenu",
	"AGM_Key_openInteractionMenuSelf",
	"CSE_m_CombinedInteractionMenu",
	"CSE_m_InteractionMenu",
	"CSE_m_SelfInteraction"
];

_cnt = 20;

waitUntil
{
	if (time > 0) then
	{
		sleep 0.5;
		_cnt = _cnt - 1;
	};
	
	{
		if ([_x] call d_uac_fnc_doesParameterExist) then
		{
			[_x, [0,false,false,false]] call d_uac_fnc_setValue_UACFormat;
			[_x] call d_uac_fnc_deleteParameter;
			
			
			_keys_to_hide set [_forEachIndex, -1];
		};
	} forEach _keys_to_hide;
	
	_keys_to_hide = _keys_to_hide - [-1];
	
	
	(count _keys_to_hide == 0) || _cnt <= 0;
}
