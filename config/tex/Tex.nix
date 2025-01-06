{
    lib,
    config,
    pkgs,
    ...
}:

{
    options = {
        Tex.enable = lib.mkEnableOption "Enable Tex module";
    };
    config = lib.mkIf config.Tex.enable { 
        plugins = {
            lsp.servers.texlab = {
                enable = true;
                
            };


            vimtex = {
                enable = true;
                texlivePackage = pkgs.texlive.combined.scheme-full;
                zathuraPackage = pkgs.zathura.override { useMupdf = true; }; # Use Zathura with MuPDF
            };
        };
        extraConfigLuaPre = ''
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = ".build" -- set whatever name you like
            }
        '';

        globals = {
            maplocalleader = " t"; # Set the local leader to "<leader>t"
        };

        #wKeyList = [
        #    ( specObj [ "<leader>t" "tex" ] )
        #    ( specObj [ "<leader>tl" "vimtex" ] )
        #];

    };

    
}
