{
    lib,
    config,
    pkgs,
    ...
}:

{
    options = {
        wlcopy.enable = lib.mkEnableOption "Enable clip module";
    };
    
    config = lib.mkIf config.wlcopy.enable { 
        
        clipboard = {
            register = "unnamedplus";
            
            providers.wl-copy = {
                enable = true;
                package = pkgs.wl-clipboard;
            };
        
        };
    };

}
