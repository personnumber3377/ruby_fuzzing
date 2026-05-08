do |r|
           r.set_encoding("utf-8", "euc-jp", :undef=>:replace, :replace=>"ZZZ")
           assert_equal("ZZZ", r.read)
         end