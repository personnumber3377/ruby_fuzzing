do |buffer|
      # Cannot modify string as it's locked by the buffer:
      assert_raise RuntimeError do
        string[0] = "h"
      end