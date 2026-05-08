do
              assert_equal megacontent.bytesize, IO.copy_stream("megasrc", s1)
            end