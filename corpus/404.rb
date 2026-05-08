do |r,w|
      w.close_on_exec = false
      src = "IO.new(#{w.fileno}).puts(:hi)"
      assert_equal true, system(*%W(#{RUBY} --disable=gems -e #{src}))
      assert_equal "hi\n", r.gets
    end