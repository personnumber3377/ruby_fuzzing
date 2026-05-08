do |i|
        Foo.new.instance_variable_set(:"@a\#{i}", nil)
      end