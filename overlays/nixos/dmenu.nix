self: super: {
  dmenu = super.dmenu.overrideAttrs (oldAttrs: {
    src = /home/juan/dmenu;
  });
}
