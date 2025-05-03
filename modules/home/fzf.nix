{...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--style=full:sharp"
      "--border=none"

      "--input-label=' Input '"

      "--list-label=' Results '"

      "--preview='bat --style=numbers --color=always {} --line-range=:500 {}'"
      "--preview-window=right:60%"

      "--prompt=' '"
      "--marker=' '"
      "--pointer="
      "--scrollbar=█"
      "--bind='focus:transform-preview-label:echo {1} '"
    ];
  };
}
