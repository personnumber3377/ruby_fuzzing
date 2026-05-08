do |f|
        args = ['-e', code, f.path]
        f.print data
        f.close
        begin
          assert_in_out_err(args, "", out, err,
                            "#{bug11444}: #{test} in #{mode} mode",
                            timeout: 10)
        rescue Exception => e
          failure << e
        end