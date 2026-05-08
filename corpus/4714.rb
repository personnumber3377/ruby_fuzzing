do |w|
      printf(w, "foo %s baz\n", "bar")
      w.close_write
    end