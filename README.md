uniaddonconf
============

Here are sources for d_uac and accessory Arma 3 addons.

  UniAddonConf addon implement an easy to use in-game menu for configuration of 
variant parameters. The menu is done in a way that it both provides easy way to 
add new parameters to menu by addon authors and to provide more-or-less 
convenient GUI for editing them by player.

  Here is the structure of the repository:
  
    - "d_uac" contains the source code for the UniAddonConf itself.
    
    - "adapters" contains accessory "adapter" addons which incorporates menus and 
        parameters of some widespread addons. Currently, it contains "adapters"
        which incorporates the menus of AGM, BWA and CSE mods into UAC. There 
        also addon "d_tua3ts3_to_uac" which provides menu section for radio 
        addon tua3ts3 which is used in tsgames.ru project.
        
    - "additional" contains accessory addons which aren't adapters. Currently it
        only contains example addon "uac_menu_config" which deletes some 
        parameters from the UAC menu.
        
    - "outdated" contains addons which doesn't work properly anymore. Currently
        there is only "d_tfar_to_uac" addon which is non-working due to 
        parameter names changes if tfar radio addon. Its functionality would be
        replaced by CBA-to-UAC addon which is planned to be implemented in the
        future.
        
  All addons are configured to be packed with cpbo.exe utility, though any other
tool could easly be used.
  
