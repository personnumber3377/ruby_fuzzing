do
        $h = {}
        (0..10).each {|i| $h[Foo.new] ||= {} }
      end