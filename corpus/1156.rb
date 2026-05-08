do
      eval <<-EOF, Sandbox::BINDING
        module TestRefinement::TestModuleUsingInvalidSelf
          Module.new.send