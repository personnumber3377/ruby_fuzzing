do
            err = ["#{t.path}:#{n+2}: warning: mismatched indentations at '#{e}' with '#{k}' at #{n1+2}"]
            t.rewind
            t.truncate(0)
            t.puts "# -*- warn-indent: false -*-"
            t.puts "# -*- warn-indent: true -*-"
            t.puts src
            t.flush
            assert_in_out_err(["-w", t.path], "", [], err, '[ruby-core:25442]')
          end