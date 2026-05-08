do |eos|
      _, expect = eval("[<<~#{eos}, '  x']\n""  y\n""eos\n")
      assert_equal('  x', expect, bug11990)
    end