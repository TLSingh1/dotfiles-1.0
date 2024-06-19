# { lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "swww init"
        "ags"
      ];
      general = {
        gaps_in = 8;
        gaps_out = 18;
        border_size = 3;
        "col.active_border" = [ 
          "rgba(329cffee)" 
          "rgba(9232ffee)" 
          # "45deg"
        ];
        "col.inactive_border" = "0x00FFFFFF";
        layout = "dwindle";
        resize_on_border = true;
      };
      decoration = {
        rounding = 15;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };
        drop_shadow = "no";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = "yes";
        bezier = [
          "md3_standard, 0.2, 0.0, 0, 1.0"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "win10, 0, 0, 0, 1"
          "gnome, 0, 0.85, 0.3, 1"
          "funky, 0.46, 0.35, -0.2, 1.2"
        ];
        animation = [
          "windows, 1, 2, md3_standard, slide"
          "border, 1, 10, default"
          "fade, 1, 0.0000001, default"
          "workspaces, 1, 4, md3_decel, slide"
          "specialWorkspace, 1, 5, overshot, slidefadevert 50%"
        ];
      };
      input = {
        touchpad = {
          natural_scroll = true;
          middle_button_emulation = true;
          tap-to-click = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
    };
    extraConfig = ''
      bind = ALT, 36, exec, kitty
      bind = ALT, 22, killactive,

      # Move focus
      bind = ALT, l, movefocus, r
      bind = ALT, h, movefocus, l
      bind = ALT, k, movefocus, u
      bind = ALT, j, movefocus, d

      # Resize windows
      bind = ALT SHIFT, H, resizeactive, -40 0
      bind = ALT SHIFT, J, resizeactive, 0 40
      bind = ALT SHIFT, K, resizeactive, 0 -40
      bind = ALT SHIFT, L, resizeactive, 40 0

      # Switch windows
      bind = ALT CTRL, H, movewindoworgroup, l
      bind = ALT CTRL, J, movewindoworgroup, d
      bind = ALT CTRL, K, movewindoworgroup, u
      bind = ALT CTRL, L, movewindoworgroup, r

      # Float + Psuedo
      bind = ALT, F, togglefloating,
      bind = ALT, P, pseudo,

      # Special workspaces
      bind = ALT, m, movetoworkspacesilent, special
      bind = ALT, s, togglespecialworkspace

      # Group windows
      # bind = ALT, G, togglegrooup
      # bind = ALT, tab, changegroupactive
      
      # Switch workspaces
      bind = ALT, 1, workspace, 1
      bind = ALT, 2, workspace, 2
      bind = ALT, 3, workspace, 3
      bind = ALT, 4, workspace, 4
      bind = ALT, 5, workspace, 5
      bind = ALT, 6, workspace, 6
      bind = ALT, 7, workspace, 7
      bind = ALT, 8, workspace, 8
      bind = ALT, 9, workspace, 9
      bind = ALT, 0, workspace, 0

      # Move active window to workspace
      bind = SUPER, 1, movetoworkspace, 1
      bind = SUPER, 2, movetoworkspace, 2
      bind = SUPER, 3, movetoworkspace, 3
      bind = SUPER, 4, movetoworkspace, 4
      bind = SUPER, 5, movetoworkspace, 5
      bind = SUPER, 6, movetoworkspace, 6
      bind = SUPER, 7, movetoworkspace, 7
      bind = SUPER, 8, movetoworkspace, 8
      bind = SUPER, 9, movetoworkspace, 9
      bind = SUPER, 0, movetoworkspace, 0

      # Fav apps
      bind = SUPER, l, exec, librewolf
      bind = SUPER, k, exec, firefox
      bind = SUPER, 47, exec, ags -t launcher
    '';
  };
}
