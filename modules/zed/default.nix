{
  # pkgs,
  ...
}: {
  # home.packages = [
  #   pkgs.zed-editor
  # ];

  programs.zed-editor.enable = true;

  programs.zed-editor.extensions = ["gleam" "nix" "toml" "yaml" "kanagawa themes"];

  programs.zed-editor.userKeymaps = {
    config = {
      keybindings = [
        # Terminal
        {
          context = "Workspace";
          bindings = {
            "ctrl-/" = "workspace::ToggleBottomDock";
          };
        }

        # Window's navigation
        {
          context = "Dock || Terminal || Editor";
          bindings = {
            # Window's motions
            "ctrl-h" = "workspace::ActivatePaneLeft";
            "ctrl-l" = "workspace::ActivatePaneRight";
            "ctrl-k" = "workspace::ActivatePaneUp";
            "ctrl-j" = "workspace::ActivatePaneDown";
          };
        }

        {
          context = "GitPanel";
          bindings = {
            "q" = "git_panel::Close";
          };
        }

        {
          context = "AgentPanel";
          bindings = {
            "ctrl-\\" = "workspace::ToggleRightDock";
            "cmd-k" = "workspace::ToggleRightDock";
          };
        }

        # File panel (netrw)
        {
          context = "ProjectPanel && not_editing";
          bindings = {
            "a" = "project_panel::NewFile";
            "A" = "project_panel::NewDirectory";
            "r" = "project_panel::Rename";
            "d" = "project_panel::Delete";
            "x" = "project_panel::Cut";
            "c" = "project_panel::Copy";
            "p" = "project_panel::Paste";
            # Close project panel as project file panel on the right
            "q" = "workspace::ToggleLeftDock";
            "space e" = "workspace::ToggleLeftDock";
            ":" = "command_palette::Toggle";
            "%" = "project_panel::NewFile";
            "/" = "project_panel::NewSearchInDirectory";
            "enter" = "project_panel::OpenPermanent";
            "escape" = "project_panel::ToggleFocus";
            "h" = "project_panel::CollapseSelectedEntry";
            "j" = "menu::SelectNext";
            "k" = "menu::SelectPrevious";
            "l" = "project_panel::ExpandSelectedEntry";
            "o" = "project_panel::OpenPermanent";
            "shift-d" = "project_panel::Delete";
            "shift-r" = "project_panel::Rename";
            "t" = "project_panel::OpenPermanent";
            "v" = "project_panel::OpenPermanent";
            "shift-g" = "menu::SelectLast";
            "g g" = "menu::SelectFirst";
            "-" = "project_panel::SelectParent";
            "ctrl-6" = "pane::AlternateFile";
          };
        }

        # Empty pane, set of keybindings that are available when there is no active editor
        {
          context = "EmptyPane || SharedScreen";
          bindings = {
            # Open file finder
            "space space" = "file_finder::Toggle";
            # New file
            "space f n" = "workspace::NewFile";
            # Open recent project
            "space f p" = "projects::OpenRecent";
            # Search in all the files
            "space s g" = "workspace::NewSearch";
            # Quit zed
            "space q q" = "zed::Quit";
          };
        }

        {
          context = "Editor && VimControl && !VimWaiting && !menu";
          bindings = {
            # Refactoring
            "space c r " = "editor::Rename";
            # Chat with AI
            "space a a" = "agent::ToggleFocus";
            "ctrl-\\" = "workspace::ToggleRightDock";
            "cmd-k" = "workspace::ToggleRightDock";
            "space a e" = "assistant::InlineAssist";
            "cmd-l" = "assistant::InlineAssist";
            "space a t" = "workspace::ToggleRightDock";
            # Git
            "space g g" = {
              name = "task::Spawn";
              options = {
                task_name = "lazygit";
                reveal_target = "center";
              };
            };
            "space g h d" = "editor::ExpandAllDiffHunks";
            "space g h D" = "git::Diff";
            "space g h r" = "git::Restore";
            "space g h R" = "git::RestoreFile";
            # Toggle inlay hints
            "space u i" = "editor::ToggleInlayHints";
            # Toggle soft wrap
            "space u w" = "editor::ToggleSoftWrap";
            # Open markdown preview
            "space m p" = "markdown::OpenPreview";
            "space m P" = "markdown::OpenPreviewToTheSide";
            # Open recent project
            "space f p" = "projects::OpenRecent";
            # Search word under cursor in current pane
            "space s w" = "buffer_search::Deploy";
            # Search word under cursor in all panes
            "space s W" = "pane::DeploySearch";
            # Tab things. Almost as good as harpoon.
            "space 1" = {
              name = "pane::ActivateItem";
              index = 0;
            };
            "space 2" = {
              name = "pane::ActivateItem";
              index = 1;
            };
            "space 3" = {
              name = "pane::ActivateItem";
              index = 2;
            };
            "space 4" = {
              name = "pane::ActivateItem";
              index = 3;
            };
            "space 5" = {
              name = "pane::ActivateItem";
              index = 4;
            };
            "space 6" = {
              name = "pane::ActivateItem";
              index = 5;
            };
            "space 7" = {
              name = "pane::ActivateItem";
              index = 6;
            };
            "space 8" = {
              name = "pane::ActivateItem";
              index = 7;
            };
            "space 9" = {
              name = "pane::ActivateItem";
              index = 8;
            };
            "space 0" = "pane::ActivateLastItem";
            "] b" = "pane::ActivateNextItem";
            "[ b" = "pane::ActivatePreviousItem";
            "space ," = "tab_switcher::Toggle";
            # Jump to the previous location
            "space b b" = "pane::AlternateFile";
            # Close buffer
            "space b d" = "pane::CloseActiveItem";
            # Close inactive buffers
            "space b q" = "pane::CloseInactiveItems";
            # New file
            "space b n" = "workspace::NewFile";
            # Search in the current buffer
            "space s b" = "vim::Search";
            # Search in all the files
            "space s g" = "workspace::NewSearch";
            "space f n" = "workspace::NewFile";
            # Search
            "space /" = "workspace::NewSearch";
            # Git
            "space g b" = "git::Blame";
            # LSP & Code actions
            "space c a" = "editor::ToggleCodeActions";
            "space s d" = "diagnostics::Deploy";
            "space s s" = "outline::Toggle";
            # Format
            "space c f" = "editor::Format";
            # File explorer
            "space e" = "workspace::ToggleLeftDock";
            # Telescope
            "space f f" = "file_finder::Toggle";
            "space space" = "file_finder::Toggle";
            # Quit zed
            "space q q" = "zed::Quit";
            # Terminal
            "space t" = "workspace::ToggleBottomDock";
            # Windows management
            "space w s" = "pane::SplitDown";
            "space w v" = "pane::SplitRight";
            "space -" = "pane::SplitDown";
            "space |" = "pane::SplitRight";
            "space w c" = "pane::CloseAllItems";
            "space w d" = "pane::CloseAllItems";
            # Jump to hunks
            "] h" = "editor::GoToHunk";
            "[ h" = "editor::GoToPreviousHunk";
            "] c" = "editor::GoToHunk";
            "[ c" = "editor::GoToPreviousHunk";
            # Jump to diagnostic
            "] d" = "editor::GoToDiagnostic";
            "[ d" = "editor::GoToPreviousDiagnostic";
            "] e" = "editor::GoToDiagnostic";
            "[ e" = "editor::GoToPreviousDiagnostic";
            # Excerpts
            "] q" = "editor::MoveToStartOfNextExcerpt";
            "[ q" = "editor::MoveToStartOfExcerpt";
          };
        }

        {
          context = "Editor && vim_mode == visual && !VimWaiting && !VimObject";
          bindings = {
            # Line's Motions
            "shift-j" = "editor::MoveLineDown";
            "shift-k" = "editor::MoveLineUp";
          };
        }

        # Center the cursor on the screen when scrolling and find all references
        {
          context = "VimControl && !menu";
          bindings = {
            "ctrl-d" = {
              name = "workspace::SendKeystrokes";
              keystrokes = "ctrl-d z z";
            };
            "ctrl-u" = {
              name = "workspace::SendKeystrokes";
              keystrokes = "ctrl-u z z";
            };
            "n" = {
              name = "workspace::SendKeystrokes";
              keystrokes = "n z z z v";
            };
            "shift-n" = {
              name = "workspace::SendKeystrokes";
              keystrokes = "shift-n z z z v";
            };
            "shift-g" = {
              name = "workspace::SendKeystrokes";
              keystrokes = "shift-g z z";
            };
            "g r" = "editor::FindAllReferences";
          };
        }

        {
          context = "vim_operator == d";
          bindings = {
            "o" = "editor::ExpandAllDiffHunks";
            "r" = "git::Restore";
          };
        }

        {
          context = "vim_mode == normal || vim_mode == visual";
          bindings = {
            "s" = "vim::PushSneak";
            "S" = "vim::PushSneakBackward";
          };
        }

        {
          context = "vim_operator == a || vim_operator == i || vim_operator == cs";
          bindings = {
            "b" = "vim::AnyBrackets";
          };
        }
      ];
    };
  };

  programs.zed-editor.userSettings = {
    agent = {
      default_model = {
        provider = "anthropic";
        model = "claude-3-5-sonnet-latest";
      };
      version = "2";
    };
    vim_mode = true;
    relative_line_numbers = true;
    ui_font_size = 16;
    buffer_font_size = 16;
    theme = {
      mode = "system";
      light = "Kanso Pearl";
      dark = "Kanso Ink (Blurred)";
    };
    load_direnv = "shell_hook";
    ui_font_family = "JetBrainsMono Nerd Font";
    buffer_font_family = "JetBrainsMono Nerd Font";
    git = {
      inline_blame = {
        delay_ms = 1000;
      };
    };
  };
}
