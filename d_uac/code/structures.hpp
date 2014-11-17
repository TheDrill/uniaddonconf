#ifndef __STRUCTURES_H__
#define __STRUCTURES_H__



#define SECT__SECTNAME 0
#define SECT__PRIORITY 1  // default priority is 0
#define SECT__ENTRIES 2


#define ENTRY__PARAMID 0
#define ENTRY__SECTION 1
#define ENTRY__SORTSTR 2
#define ENTRY__VALUEHND 3
#define ENTRY__TYPEHND 4
#define ENTRY__TYPEOPT 5 // depends on type
#define ENTRY__DEFAULT_VALUE 6
#define ENTRY__PARAMDESC 7 // description strings array (the first string is parameter name)
#define ENTRY__VALUEHNDPARAMS 8 // optional data which would be passed to all valuehnd functions


#define VALUEHND__READFNC 0 // receives [param id] as argument. Must return current value of parameter
#define VALUEHND__WRITEFNC 1 // receives [param id, value] as argument. Must apply new value of parameter
#define VALUEHND__PROFHND 2 // optional profile saving handlers. If the 3rd element is absent, then UAC default profile saving and reading is done. If it is [] --- an empty array, then no profile reading/writing would be done at all. If it is [readfnc, writefnc], then those functions would be used for handling saving and reading of parameter value to/from profile.

#define PROFHND_READFNC 0 // receives [param id] as argument. Must return saved to profile (or another permanent storage) value of parameter
#define PROFHND_WRITEFNC 1 // receives [param id, value] as argument. Must save given value of parameter to profile (or another permanent storage)

#define TYPEHND__DESCFNC 0 // receives [desc array, type args, current value]. Returns [parameter short description, current value string]
#define TYPEHND__CHANGEFNC 1 // receives [desc array, type args, current value, default value]. Returns new value
#define TYPEHND__COMPAREFNC 2 // receives [value 1, value 2, type args]. Returns true, if they're equal; false otherwise
#define TYPEHND__VALIDVALFNC 3 // receives [value, type args]. Returns true, if the value is correct for current type


#define SECT_LISTBOX_IDC 534001
#define ENT_LISTBOX_IDC 534002




#endif
