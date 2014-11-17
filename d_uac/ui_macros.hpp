#ifndef __UI_MACROS_H__
#define __UI_MACROS_H__


#define WIDTH_BASE_SIZE ( ((safezoneW / safezoneH) min 1.2) / 40 )
#define HEIGHT_BASE_SIZE ( (((safezoneW / safezoneH) min 1.2) / 1.2) / 25 )
#define HEIGHT_BASE_SIZE_2 ( (((safezoneW / safezoneH) min 1.2) / 1.2) )




#define BED_W 26 * WIDTH_BASE_SIZE
#define BED_H 16 * HEIGHT_BASE_SIZE
#define BED_X 0.5 - BED_W / 2
#define BED_Y 0.5 - BED_H / 2

#endif
