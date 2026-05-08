do
        require t.path
      rescue rescue_all
        assert(false, "should not reach here")
      end