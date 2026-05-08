do
      assert_warning(/ignored/) {eval('/#{"\\\\"}y/')}
    end