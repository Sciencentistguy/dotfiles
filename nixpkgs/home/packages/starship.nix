{ pkgs, ... }:
let inherit (pkgs.stdenv) isDarwin; in
{
  programs.starship.package = pkgs.starship-sciencentistguy;
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.starship.enableBashIntegration = false;
  programs.starship.settings = {
    add_newline = false;
    format = "$all";
    character = {
      success_symbol = "[<I>](bold fg:246) [➜](bold #98C379)";
      cancel_symbol = "[<I>](bold fg:246) [➜](bold #EFC07B)";
      error_symbol = "[<I>](bold fg:246) [➜](bold #E06C75)";
      vicmd_success_symbol = "[<N>](bold fg:246) [➜](bold #98C379)";
      vicmd_cancel_symbol = "[<N>](bold fg:246) [➜](bold #EFC07B)";
      vicmd_error_symbol = "[<N>](bold fg:246) [➜](bold #E06C75)";
    };
    username = {
      style_root = "bold #E06C75";
      style_user = "bold #EFC07B";
    };
    aws = {
      disabled = true;
    };
    battery = {
      disabled = !isDarwin;
    };
    cmd_duration = {
      min_time = 5000;
      show_milliseconds = true;
    };
    directory = {
      truncation_length = 8;
      truncate_to_repo = true;
      read_only = " 🔒";
      style = "bold #61AFEF";
    };
    hostname = {
      ssh_only = false;
      style = "bold #98C379";
    };
    username = {
      show_always = true;
      format = "[$user]($style)@";
    };
    package = {
      disabled = true;
    };
    git_branch = {
      style = "bold #C678DD";
    };
    git_status = {
      style = "bold #E06C75";
    };
    cmake = {
      # Nerd fonts are hard on darwin
      symbol = if isDarwin then "🛆 " else "";
    };
    nix_shell = {
      impure_msg = "";
      pure_msg = "";
      format = "within [$symbol($name)]($style) ";
      symbol = if !isDarwin then " " else "";
    };
  };
}