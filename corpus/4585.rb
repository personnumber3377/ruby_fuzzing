do |w|
          File.open("foo", "w") {|f| f << "abcd" }
          File.open("foo") {|f|
            f.read(1)
            assert_equal(3, IO.copy_stream(f, w, 10, 1))
          }
          w.close
        end