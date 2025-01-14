{
  pkgs,
  pkgs-unstable,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;

    packages = with pkgs; [
      zoxide
      lsd
      bat
      zsh-autocomplete
      pkgs-unstable.yadm
      pfetch-rs
      gh

      # js
      fnm
      pkgs-unstable.bun

      # rust
      rustup

      # nix
      nixd
      alejandra

      # gui
      vscode
      kitty
      pkgs-unstable.ghostty
      pkgs-unstable.firefox-devedition-bin

      # fonts
      victor-mono
      pkgs-unstable.nerd-fonts.victor-mono
    ];
  };
}
