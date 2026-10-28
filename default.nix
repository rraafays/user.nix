{
  config,
  pkgs,
  lib,
  ...
}:

let
  user = config.common.username;
in
{
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  system.stateVersion = lib.mkDefault "26.05";

  home-manager.users.${user} =
    let
      gitName = config.common.username;
      gitEmail = config.common.email;
    in
    {
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ ./home-manager.nix ];
      programs.git = {
        enable = true;
        settings.user = {
          name = gitName;
          email = gitEmail;
        };
      };
    };

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      amberol
      apostrophe
      audio-sharing
      blanket
      bottles
      cine
      collision
      constrict
      crosspipe
      cursor-cli
      curtail
      davinci-resolve
      dialect
      eartag
      eyedropper
      fragments
      fretboard
      gimp3
      gnome-boxes
      gnome-mahjongg
      gnome-obfuscate
      impression
      junction
      mpv
      multiplex
      paper-clip
      pika-backup
      rawtherapee
      rockbox-utility
      switcheroo
      tor-browser
      ungoogled-chromium
      valuta
      video-trimmer
      wechat
    ];
  };
}
