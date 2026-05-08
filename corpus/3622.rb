double_splat(*[1], 2, **{})
      RUBY

      assert_prism_eval(<<-CODE)
        class Foo
          def []=(a, b)
            1234
          end