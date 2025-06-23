{...}: {
    programs.zellij = {
        enable = true;
    };

    home.file.".config/zellij/config.kdl".text = ''
        theme "everforest-dark"
        pane_frames false
        auto_layout true
        copy_on_select true
        show_release_notes false
        show_startup_tips false
        on_force_close "detach"


        keybinds clear-defaults=true {
            normal {
                bind "Alt Shift c" { Copy; }
            }
            locked {
                bind "Alt g" { SwitchToMode "Normal"; }
            }
            scroll {
                bind "Alt s" { SwitchToMode "Normal"; }
                bind "e" { EditScrollback; SwitchToMode "Normal"; }
                bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
                bind "Alt c" { ScrollToBottom; SwitchToMode "Normal"; }
                bind "j" "Down" { ScrollDown; }
                bind "k" "Up" { ScrollUp; }
                bind "Alt f" "PageDown" "Right" "l" { PageScrollDown; }
                bind "Alt b" "PageUp" "Left" "h" { PageScrollUp; }
                bind "d" { HalfPageScrollDown; }
                bind "u" { HalfPageScrollUp; }
                // bind "Alt c" { Copy; }
            }
            search {
                bind "Alt s" "Esc" { SwitchToMode "Normal"; }
                bind "Alt c" { ScrollToBottom; SwitchToMode "Normal"; }
                bind "j" "Down" { ScrollDown; }
                bind "k" "Up" { ScrollUp; }
                bind "Alt f" "PageDown" "Right" "l" { PageScrollDown; }
                bind "Alt b" "PageUp" "Left" "h" { PageScrollUp; }
                bind "d" { HalfPageScrollDown; }
                bind "u" { HalfPageScrollUp; }
                bind "n" { Search "down"; }
                bind "p" { Search "up"; }
                bind "c" { SearchToggleOption "CaseSensitivity"; }
                bind "w" { SearchToggleOption "Wrap"; }
                bind "o" { SearchToggleOption "WholeWord"; }
            }
            entersearch {
                bind "Alt c" "Esc" { SwitchToMode "Scroll"; }
                bind "Enter" { SwitchToMode "Search"; }
            }
            session {
                bind "Alt o" { SwitchToMode "Normal"; }
                bind "Alt s" { SwitchToMode "Scroll"; }
                bind "d" { Detach; }
                bind "w" {
                    LaunchOrFocusPlugin "session-manager" {
                        floating true
                        move_to_focused_tab true
                    };
                    SwitchToMode "Normal"
                }
                bind "p" {
                    LaunchOrFocusPlugin "plugin-manager" {
                        floating true
                        move_to_focused_tab true
                    };
                    SwitchToMode "Normal"
                }
                bind "a" {
                    LaunchOrFocusPlugin "zellij:about" {
                        floating true
                        move_to_focused_tab true
                    };
                    SwitchToMode "Normal"
                }
            }

            shared_except "locked" {
                bind "Alt g" { SwitchToMode "Locked"; }
                bind "Alt s" { SwitchToMode "Scroll"; }
                bind "Alt o" { SwitchToMode "Session"; }


                // Change pane focus
                bind "Alt j" { FocusNextPane; }
                bind "Alt k" { FocusPreviousPane; }

                // Move pane
                bind "Alt Shift j" { MovePane; }
                bind "Alt Shift k" { MovePaneBackwards; }

                // Create pane
                bind "Alt n" { NewPane; }

                // Close pane
                bind "Alt q" { CloseFocus; }

                // Create tab
                bind "Alt Enter" { NewTab; }

                // Toggle floating pane
                bind "Alt {" "Alt f" { ToggleFloatingPanes; }

                // Toggle fullscreen
                bind "Alt m" { ToggleFocusFullscreen; }

                // Resize pane
                bind "Alt h" { Resize "Increase Left"; }
                bind "Alt l" { Resize "Increase Right"; }
                bind "Alt +" { Resize "Increase Up"; }
                bind "Alt ´" { Resize "Increase Down"; }

                // Change layout
                bind "Alt [" { PreviousSwapLayout; }
                bind "Alt ]" { NextSwapLayout; }

                // Switch tab
                bind "Alt 1" { GoToTab 1; }
                bind "Alt 2" { GoToTab 2; }
                bind "Alt 3" { GoToTab 3; }
                bind "Alt 4" { GoToTab 4; }
                bind "Alt 5" { GoToTab 5; }
                bind "Alt 6" { GoToTab 6; }
                bind "Alt 7" { GoToTab 7; }
                bind "Alt 8" { GoToTab 8; }
                bind "Alt 9" { GoToTab 9; }
            }
        }
        shared_except "scroll" "locked" {
            bind "Alt s" { SwitchToMode "Scroll"; }
        }
        shared_except "session" "locked" {
            bind "Alt o" { SwitchToMode "Session"; }
        }
    '';
}
