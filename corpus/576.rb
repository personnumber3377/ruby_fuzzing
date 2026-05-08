do |o|
      assert_nothing_raised(TypeError, "#{bug2788} (#{o.inspect})") do
        o.instance_eval {
          def defd_using_instance_eval() :ok end