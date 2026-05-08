do |sig|
    if Signal.list.key?(sig)
      define_method("test_trap_uncatchable_#{sig}") do
        assert_raise(Errno::EINVAL, "SIG#{sig} is not allowed to be caught") { Signal.trap(sig) {} }
      end