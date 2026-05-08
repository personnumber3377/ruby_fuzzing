do
      eval("recv = self; recv.using Module.new", Sandbox::BINDING)
    end