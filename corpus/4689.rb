do |f|
          assert_equal 0, f.pos, "mode=r#{mode}"
          assert_equal '0', f.getc, "mode=r#{mode}"
          assert_equal 1, f.pos, "mode=r#{mode}"
          assert_equal '1', f.getc, "mode=r#{mode}"
          assert_equal 2, f.pos, "mode=r#{mode}"
          assert_equal '2', f.getc, "mode=r#{mode}"
          assert_equal 3, f.pos, "mode=r#{mode}"
          assert_equal '3', f.getc, "mode=r#{mode}"
          assert_equal 4, f.pos, "mode=r#{mode}"
          assert_equal '4', f.getc, "mode=r#{mode}"
        end