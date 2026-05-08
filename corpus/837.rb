do |p1, p2|
      src = <<~EOM
      #{"Bar = " + preset if preset}
      class Foo
        #{p1}::Bar #{op}= 42
        #{p2}
      end