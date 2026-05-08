do
      lambda do
        next
      rescue
        assert(false)
      ensure
        raise string
      end