do
        class << self
          $test_singleton_class_shared_cref_ps << Proc.new{
            def xyzzy
              self
            end