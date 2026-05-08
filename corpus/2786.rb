do
      bin2 = iseq_to_binary(iseq)
      assert_equal(bin, bin2, message(mesg) {diff hexdump(bin), hexdump(bin2)})
    end