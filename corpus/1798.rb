do
        undef succ
        alias succ old_succ
        undef <
        alias < old_lt
      end