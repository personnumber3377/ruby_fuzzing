do)")
      assert_prism_eval("defined?(retry)")

      assert_prism_eval(<<~RUBY)
        class PrismDefinedReturnNode
          def self.m1; defined?(return) end