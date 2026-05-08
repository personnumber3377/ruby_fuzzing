do
      break eval(%q({foo: 1, "foo-bar": 2, "hello-#{x}": 3, 'hello-#{x}': 4, 'bar': {}}))
    end