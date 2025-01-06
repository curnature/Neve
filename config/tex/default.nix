{
    lib,
    config,
    ...
}:

{
    imports = [
        ./Tex.nix
    ];
    options = {
        tex.enable = lib.mkEnableOption "Enable tex module";
    };
    config = lib.mkIf config.tex.enable {
        Tex.enable = lib.mkDefault true;
    };

 }
