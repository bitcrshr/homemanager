{ pkgs, ... }: {
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
}
