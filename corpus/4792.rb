do |r, w|
        thread = Thread.new do
          begin
            q << true
            assert_raise_with_message(IOError, /stream closed/) do
              while r.gets
              end