do |chars, pattern|
        10.times do |n|
          an = @it.alphanumeric(n, chars: chars)
          assert_match(pattern, an)
          assert_equal(n, an.length)
        end