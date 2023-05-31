{ pkgs, ... }: {

  programs.helix = {
    enable = true;
 
    settings = {
      theme = "onedark";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape.insert = "bar";
        shell = [ "fish" ];
        indent-guides = {
          render = true;
        };
      };

      keys.normal = {
        ";" = "insert_mode";
        "i" = "move_line_up";
        "j" = "move_char_left";
        "k" = "move_line_down";
        "l" = "move_char_right";
        "h" = "collapse_selection";
        "A-h" = "flip_selections";

        "A-j"  = "select_prev_sibling";
        "A-k"  = "shrink_selection";
        "A-l"  = "expand_selection";
        "A-;" = "select_next_sibling";
      };

      keys.insert = {
        "C-backspace" = "delete_word_backward";
      };

      keys.select = {
        
      };
    };
  };
}
