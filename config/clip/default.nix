{
    lib,
    config,
    ...
}:

{
    imports = [
        ./wlcopy.nix
    ];
    options = {
        clip.enable = lib.mkEnableOption "Enable clip module";
    };
    config = lib.mkIf config.tex.enable {
        wlcopy.enable = lib.mkDefault true;
    };

 }
