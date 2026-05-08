do |r|
           result = nil
           assert_nothing_raised("[ruby-dev:33264]") { result = Marshal.load(r) }
           assert_equal(data, result)
         end