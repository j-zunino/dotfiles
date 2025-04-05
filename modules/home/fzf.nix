{...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--preview='bat --style=numbers --color=always {}'"
      "--preview-window=right:60%"
      "--preview-window=border-sharp"
      "--border=sharp"
      "--prompt=' '"
      "--marker= "
      "--pointer="
      "--separator=─"
      "--scrollbar=█"
      "--info=right"
    ];
  };
}
