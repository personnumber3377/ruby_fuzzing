do
      eval(<<-EOF, Sandbox::BINDING)
        $main = self
        module M
        end