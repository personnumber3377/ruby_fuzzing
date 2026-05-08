do |r|
           assert_equal(Encoding::UTF_8, r.external_encoding)
           assert_equal(Encoding::EUC_JP, r.internal_encoding)
           assert_equal(eucjp, r.read)
         end