do
    remove_const :C if defined? ::TestRubyPrimitive::C
    remove_const :A if defined? ::TestRubyPrimitive::A

    C = 1
    class A
      Const = 1
      class B
        Const = 2
        class C
          Const = 3
          def const
            Const
          end