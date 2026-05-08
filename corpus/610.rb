do |k, v|
      assert_include(Encoding.name_list, k)
      assert_include(Encoding.name_list, v)
      assert_instance_of(String, k)
      assert_instance_of(String, v)
    end