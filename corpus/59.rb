do;
      alias $#{name} $/
      assert_deprecated_warning(/\\$#{name}/) { $#{name} = "" }
      assert_raise_with_message(TypeError, /\\$#{name}/) { $#{name} = 1 }
    end