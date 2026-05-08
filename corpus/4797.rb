do
        assert_nothing_raised(RuntimeError, /frozen IOError/) do
          IO.pipe do |r, w|
            th = Thread.start {r.close}
            r.gets
          rescue IOError
            # swallow pend