do
      self.class.const_get([User, 'USER', 'Foo'].join('::'))
    end