do |op|
      assert_equal(Encoding::US_ASCII, op.intern.encoding, "[ruby-dev:33449]")
    end