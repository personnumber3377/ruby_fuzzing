do
          assert(require file.path)
          assert_equal(1, ::AutoloadTest)
        end