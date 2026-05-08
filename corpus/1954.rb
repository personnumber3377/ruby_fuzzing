do
          assert_raise_with_message(RegexpError, /parse depth limit over/, bug) do
            Regexp.new(src)
          end