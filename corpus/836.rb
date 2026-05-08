do |p1, p2|
      src = <<~EOM
      class Foo
        #{"Bar = " + preset if preset}
      end