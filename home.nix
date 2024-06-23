{ lib, pkgs, ... };
{
    home = {
        packages = with pkgs; [
            hello
        ];

        username = "chandler";
        homeDirectory = "/home/chandler";

        stateVersion = "23.11";
    };
}
