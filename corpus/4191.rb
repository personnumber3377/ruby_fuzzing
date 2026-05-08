do |key|
      assert_warning(/key #{Regexp.quote(eval(key).inspect)} is duplicated/) { eval("{#{key} => :bar, #{key} => :foo}") }
    end