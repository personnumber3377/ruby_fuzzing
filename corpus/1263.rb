do
    remove_const :A8 if defined? TestRubyPrimitive::A8

    class A8
      @@c = 1
      class << self
        def m
          @@c += 1
        end