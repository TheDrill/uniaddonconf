Main advantages of UAC:
1. Easy to add new parameter to the menu. In most common case it's enough to execute just one script command.

2. All parameters are placed inside sections, the order of parameters in which they appear in menu could be manipulated through assigning sorting strings.

3. Automatic profile saving/reading.

4. The menu is very flexible. It is possible to have various types of parameters (both predefined in UAC addon and custom), to define the way for saving and reading of parameters values (if the default is not appropriate), to disable UAC profile saving/reading or to define the exact way of doing that.

5. The interface of the menu is mostly consistent to ArmA 3 original menus.

6. All functions of UAC could safely be called at any time (including the most early init handlers) --- all of them are non-blocking, automatically initializing and more-or-less syncronized.

Functions in UAC are divided on private and public. The functions which start with "_" are private and shouldn't be used directly. All public functions have descriptions (though, I'm afraid, not on a good English).

At the moment UAC has 2 built-in types:
1. Keybinding type.
2. Boolean type.

It is possible to add custom types (though it would be needed to provide dialog interface to change its value).

The most easy way to register parameter of "keybinding" or "boolean" type is to use one of the following functions:
   d_uac_fnc_registerKeyBindingVariable
   d_uac_fnc_registerBooleanVariable

For example, if you have a variable
   myKeyBindingVariable = [55, false, false, false];

which contains a key combination for some action (the first one is key code, then follows shift, ctrl, alt statuses), then to register it to UAC is enough to issue the command:
	 ["myKeyBindingVariable", "My section", "Description for the parameter", "SORTINGSTRING"] call d_uac_fnc_registerKeyBindingVariable;
This command would create section "My section" and add there an entry "Description for the parameter", which would be binded to the value of variable myKeyBindingVariable. The "SORTINGSTRING" is used to determine the position of the parameter in the list and could be any string (or array of numbers), even "". The default value for the parameter would be then the value of the variable before registration ([55, false, false, false]). The new values for the parameter (or the ones from user profile) would automatically assigned to the variable by UAC.

In a similar manner, to register boolean variable
   myBooleanVariable = false;
is enough to issue the command:
	 ["myBooleanVariable", "My section", "Description for the parameter", "SORTINGSTRING"] call d_uac_fnc_registerBooleanVariable;
The more general ways for registering parameters are functions:
   d_uac_fnc_registerVariable
   d_uac_fnc_registerParameter

d_uac_fnc_registerVariable is just simplified version of d_uac_fnc_registerParameter. It all the same as functions for registering keybindings and boolean with the exception that it's needed to explicitly define the type (for built-in types: d_uac_fnc_type_boolean or d_uac_fnc_type_keyBinding) here.

d_uac_fnc_registerParameter is the most general registration function. Here you should additionaly provide functions a pair of functions for reading/writing value of the parameter (d_uac_fnc_registerVariable provides here the functions which just read the value of variable and writes new value to the parameter).

Several other functions and features are provided for manipulating the menu. See the attached addons for more examples.

UAC menu also provides 3 default sections:
	localize "STR_Addons__d_uac_Section_Keys"
	localize "STR_Addons__d_uac_Section_General"
	localize "STR_Addons__d_uac_Section_MissionSpecific"
which could be used when registering new parameters.
