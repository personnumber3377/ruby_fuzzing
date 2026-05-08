do |tmp|
      req = File.join(tmp, "very_long_file_name.rb")
      File.write(req, "p :ok\n")
      assert_file.exist?(req)
      req[/.rb$/i] = ""
      assert_in_out_err([], <<-INPUT, %w(:ok), [])
        require "#{req}"
        require "#{req}"
      INPUT
    end