do |r, w|
      assert_warning(/#{n}/) {
        r.autoclose=false
        io = c.new(r.fileno) {}
        io.close
      }
    end