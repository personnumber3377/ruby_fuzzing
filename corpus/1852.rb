do
    string = "[ruby-core:82936] [Bug #13930]"

    assert_raise_with_message(RuntimeError, string) do
      i = 0
      lambda do
        i += 1
        redo if i < 2
      rescue
        assert(false)
      ensure
        raise string
      end