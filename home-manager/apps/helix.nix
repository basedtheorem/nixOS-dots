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
        "u" = "move_line_up";
        "n" = "move_char_left";
        "e" = "move_line_down";
        "i" = "move_char_right";
        "h" = "collapse_selection";
        "A-h" = "flip_selections";

        "A-n"  = "select_prev_sibling";
        "A-e"  = "shrink_selection";
        "A-i"  = "expand_selection";
        "A-o" = "select_next_sibling";
      };

      keys.insert = {
        "C-backspace" = "delete_word_backward";
      };

      keys.select = {
        
      };
    };
  };
}
