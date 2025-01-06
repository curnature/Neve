{
    lib,
    config,
    ...
}:

{
    imports = [
        ./Tex.nix
    ];

    config = lib.mkIf config.dap.enable {
        Tex.enable = lib.mkDefault true;
    };

 }
