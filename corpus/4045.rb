do |r|
           r.set_encoding("utf-8", "euc-jp", :undef=>:replace)
           assert_equal("?", r.read)
         end