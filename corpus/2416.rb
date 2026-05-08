do
            err = ["#{t.path}:#{n}: warning: mismatched indentations at '#{e}' with '#{k}' at #{n1}"]
            t.rewind
            t.truncate(0)
            t.puts src
            t.flush
            assert_in_out_err(["-w", t.path], "", [], err)
            assert_in_out_err(["-wr", t.path, "-e", ""], "", [], err)
          end