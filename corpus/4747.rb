do |adv|
        [[0,0], [0, 20], [400, 2]].each do |offset, len|
          open(tf.path) do |t|
            assert_raise_with_message(NotImplementedError, /#{Regexp.quote(adv.inspect)}/, feature4204) { t.advise(adv, offset, len) }
          end