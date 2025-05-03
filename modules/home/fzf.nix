{...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--style=full"
      "--border=none"

      "--input-label=' Input '"
      "--input-border=sharp"

      "--list-label=' Results '"
      "--list-border=sharp"

      "--preview='bat --style=numbers --color=always {} --line-range=:500 {}'"
      "--preview-window=right:60%"
      "--preview-border=sharp"

      "--prompt=' '"
      "--marker=' '"
      "--pointer="
      "--scrollbar=█"
      "--bind='focus:transform-preview-label:echo {1} '"
    ];
  };
}
