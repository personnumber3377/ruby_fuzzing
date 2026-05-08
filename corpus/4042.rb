do |r|
           r.set_encoding("utf-8:euc-jp", :invalid=>:replace)
           assert_equal("?", r.read)
         end