do |a|
        if a.class == Hash and !a.default_proc and a.size == 3 &&
           a[0] == 1 && a[1] == 4 && a[2] == 17
          # should not be found.
          raise
        end