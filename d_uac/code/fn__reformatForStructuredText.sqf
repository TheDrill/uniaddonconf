private ["_temp"]; 

_temp = []; 
{ 
	switch _x do {
		case 60: { _temp = _temp + toArray "&lt;"; };
		case 62: { _temp = _temp + toArray "&gt;"; };
		default { _temp = _temp + [_x]; }; 
	}; 
} forEach (toArray _this);


toString _temp;
