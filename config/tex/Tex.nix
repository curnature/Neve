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
                zathuraPackage = pkgs.zathura;
                #
                settings = {
                    view_method = "zathura";
                };

            };
 
        };
        
        extraConfigLuaPre = ''
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = ".build" -- set whatever name you like
            }
            
            vim.g.maplocalleader = "t" -- Set the local leader key in Lua

            -- Treesitter configuration
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                    disable = { "latex" }, -- Disable Treesitter for LaTeX
                },
                -- Other Treesitter settings
            }

            -- Enable VimTeX syntax highlighting
            vim.g.vimtex_syntax_enabled = 1
            -- vim.g.vimtex_syntax_conceal_disable = 1 -- Optional: Disable VimTeX warning

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
