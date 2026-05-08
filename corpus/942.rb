do
      remove_const :SCRIPT_LINES__
      const_set(:SCRIPT_LINES__, script_lines) if script_lines
    end