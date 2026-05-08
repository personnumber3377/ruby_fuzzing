do
        EnvUtil.with_default_internal(Encoding::UTF_8) do
          open("tmp", "r") {|f|
            assert_equal(Encoding::ASCII_8BIT, f.external_encoding)
            assert_equal(nil, f.internal_encoding)
          }
          open("tmp", "r:ascii-8bit") {|f|
            assert_equal(Encoding::ASCII_8BIT, f.external_encoding)
            assert_equal(nil, f.internal_encoding)
          }
          open("tmp", "r:ascii-8bit:utf-16") {|f|
            assert_equal(Encoding::ASCII_8BIT, f.external_encoding)
            assert_equal(nil, f.internal_encoding)
          }
        end