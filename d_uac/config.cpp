class CfgPatches
{
	class d_uac
	{
		units[]={};
		weapons[]={};
		requiredAddons[]={"A3_UI_F"};
		author[]=
		{
			"Drill"
		};
		addon_version=6.8;
	};
};

#define FUNCTIONS__RECOMPILE 0

class CfgFunctions
{
	class d_uac
	{
		class Main
		{
			file="\xx\addons\d_uac\code";
			class _init
			{
				preInit=1;
				postInit=0;
				recompile=FUNCTIONS__RECOMPILE;
			};

			class setSectionPriority {recompile=FUNCTIONS__RECOMPILE;};
			class setParameterDefaultValue {recompile=FUNCTIONS__RECOMPILE;};
			
			class showConfigDialog {recompile=FUNCTIONS__RECOMPILE;};
			
			class registerParameter {recompile=FUNCTIONS__RECOMPILE;};
			class registerVariable {recompile=FUNCTIONS__RECOMPILE;};
			
			class deleteParameter {recompile=FUNCTIONS__RECOMPILE;};
			class doesParameterExist {recompile=FUNCTIONS__RECOMPILE;};
			class setValue_UACFormat {recompile=FUNCTIONS__RECOMPILE;};
			
			class addHook {recompile=FUNCTIONS__RECOMPILE;};
			class removeHook {recompile=FUNCTIONS__RECOMPILE;};
			
			class type_keyBinding {recompile=FUNCTIONS__RECOMPILE;};
			class registerKeyBindingVariable {recompile=FUNCTIONS__RECOMPILE;};
			
			class type_boolean {recompile=FUNCTIONS__RECOMPILE;};
			class registerBooleanVariable {recompile=FUNCTIONS__RECOMPILE;};

			class type_enum {recompile=FUNCTIONS__RECOMPILE;};
			class registerEnumVariable {recompile=FUNCTIONS__RECOMPILE;};

			class type_procedure {recompile=FUNCTIONS__RECOMPILE;};
			class registerProcedure {recompile=FUNCTIONS__RECOMPILE;};

			class type_number {recompile=FUNCTIONS__RECOMPILE;};
			class registerNumberVariable {recompile=FUNCTIONS__RECOMPILE;};

			class type_string {recompile=FUNCTIONS__RECOMPILE;};
			class registerStringVariable {recompile=FUNCTIONS__RECOMPILE;};


			class _showEntriesInSection {recompile=FUNCTIONS__RECOMPILE;};
			class _onDialogClosed {recompile=FUNCTIONS__RECOMPILE;};
			class _onEntryClicked {recompile=FUNCTIONS__RECOMPILE;};
			class _KET__ShowComb {recompile=FUNCTIONS__RECOMPILE;};
			class _reformatForStructuredText {recompile=FUNCTIONS__RECOMPILE;};
			class _getPendingValue {recompile=FUNCTIONS__RECOMPILE;};
			class _setPendingValue {recompile=FUNCTIONS__RECOMPILE;};
			class _defaults {recompile=FUNCTIONS__RECOMPILE;};
			class _compareSortingArray {recompile=FUNCTIONS__RECOMPILE;};
			class _applySectionPriority {recompile=FUNCTIONS__RECOMPILE;};
			
			class _initUAC {recompile=FUNCTIONS__RECOMPILE;};
			
			class _syncRunThread {recompile=FUNCTIONS__RECOMPILE;};
			class _syncRun {recompile=FUNCTIONS__RECOMPILE;};
			
			class _applyHooks {recompile=FUNCTIONS__RECOMPILE;};
			
			class _readFromProfileNamespace {recompile=FUNCTIONS__RECOMPILE;};
			class _writeToProfileNamespace {recompile=FUNCTIONS__RECOMPILE;};
			class _clearProfileNamespace {recompile=FUNCTIONS__RECOMPILE;};
		};
	};
};




#include "config_ui.hpp"
