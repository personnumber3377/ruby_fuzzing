do
      Thread.start do
        assert_in_out_err([], src, timeout: 20) {|stdout, stderr|
          assert_no_match(/hi.*hi/, stderr.join, bug3585)
        }
      end