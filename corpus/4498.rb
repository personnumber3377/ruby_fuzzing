do
      assert_equal(a, Marshal.load(Marshal.dump(a)), bug1932)
    end