do |r|
           assert_equal("\e$B$\"\e(B".force_encoding("iso-2022-jp"), r.read)
         end