do
        eval <<-END
          class ::Object
            module A
              autoload :C, 'test-ruby-core-69206'
            end