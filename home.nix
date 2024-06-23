{ lib, pkgs, ... }:
{
    home = {
        packages = with pkgs; [
            home-manager
            gh
        ];

        username = "chandler";
        homeDirectory = "/home/chandler";

        stateVersion = "23.11";
    };

    programs = {
        zsh = {
            enable = true;
        };

        tmux = {
          enable = true;
          plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.better-mouse-mode
            tmuxPlugins.yank
            tmuxPlugins.nord
          ];
          extraConfig = ''
            new-session
            set-window-option -g mouse on
            set -g history-limit 30000
            set-option -g mouse on
            set -g set-clipboard on
            set -as terminal-features ',rxvt-unicode-256color:clipboard'
            set -sg escape-time 10
          '';
        };

        helix = {
            enable = true;
            defaultEditor = true;
            settings = {
                theme = "material_palenight";  
                editor = {
                    true-color = true;
                    auto-format = true;  
                    indent-guides.render = true;

                    lsp = {
                        display-inlay-hints = true;
                    };
                };

                keys = {
                    normal = {
                        "_" = "goto_line_start";
                        "$" = "goto_line_end";
                        "{" = "goto_prev_paragraph";  
                        "}" = "goto_next_paragraph";
                    };

                    select = {
                        "_" = "goto_line_start";
                        "$" = "goto_line_end";
                        "{" = "goto_prev_paragraph";  
                        "}" = "goto_next_paragraph";
                    };
                };
            };

            languages = {
                language = [
                    {
                        name = "go";
                        auto-format = true;
                        formatter.command = "goimports";
                    }    

                    {
                        name = "rust";
                        auto-format = true;
                    }

                    {
                        name = "json";
                        config = { 
                            provideFormatter = true; 
                            json.keeplines.enable = true;
                        };
                    }

                    {
                        name = "typescript";
                        language-servers = [ "typescript-language-server" "eslint" ];
                        formatter = {
                            command = "prettier"; 
                            args = [ "--parser" "typescript" ];
                        };
                        auto-format = true;
                        indent = {
                            tab-width = 4;
                            unit = "    ";
                        };
                    }

                    {
                        name = "javascript";
                        language-servers = [ "typescript-language-server" "eslint"];
                        formatter = {
                            command = "prettier";
                            args = [ "--parser" "typescript" ];
                        };
                        auto-format = true;
                        indent = {
                            tab-width = 4;
                            unit = "    ";
                        };
                    }

                    {
                        name = "json";
                        formatter = {
                            command = "prettier";
                            args = [ "--parser" "json" ];  
                        };
                        auto-format = true;
                        indent = {
                            tab-width = 4;
                            unit = "    ";
                        };
                    }

                    {
                        name = "html";
                        formatter = {
                            command = "prettier";
                            args = [ "--parser" "html" ];  
                        };
                        indent = {
                            tab-width = 4;
                            unit = "    ";
                        };
                    }

                    {
                        name = "svelte";
                        indent = {
                            tab-width = 4;
                            unit = "    ";
                        };
                        auto-format = true;
                        language-servers = [ "svelteserver" "tailwindcss-ls" ];
                    }
                ];
            };
        };
    };
}
