do
            t.rewind
            t.truncate(0)
            t.puts "# -*- warn-indent: false -*-"
            t.puts src
            t.flush
            assert_in_out_err(["-w", t.path], "", [], [], '[ruby-core:25442]')
          end