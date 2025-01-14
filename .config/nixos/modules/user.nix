{
  pkgs,
  pkgs-unstable,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.fish;

    packages = with pkgs; [
      zoxide
      lsd
      bat
      pkgs-unstable.yadm
      pfetch-rs
      gh

      # js
      fnm
      pkgs-unstable.bun

      # rust
      rustup

      # nix
      alejandra

      # lsp
      nixd
      fish-lsp

      # gui
      vscode
      kitty
      pkgs-unstable.ghostty
      pkgs-unstable.firefox-devedition-bin
      mojave-gtk-theme
      breeze-qt5
      breeze-gtk
      dracula-icon-theme
      kdePackages.ocean-sound-theme

      # fonts
      victor-mono
      pkgs-unstable.nerd-fonts.victor-mono
      noto-fonts
      noto-fonts-color-emoji
    ];
  };
}
