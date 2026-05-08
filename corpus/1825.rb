do |proc_type|
      assert_equal 222, @box::ProcInBox.make_const_proc(proc_type).call, "ProcLookupTestA::B::VALUE should be 222 in @box"
      assert_equal "foo", @box::ProcInBox.make_str_const_proc(proc_type).call, "String::FOO should be \"foo\" in @box"
      assert_equal "yay", @box::ProcInBox.make_str_proc(proc_type).call, "String#yay should be callable in @box"
      #
      # TODO: method calls not-in-methods nor procs can't handle the current box correctly.
      #
      # assert_equal "yay,foo,222",
      #              @box::ProcInBox.const_get(('CONST_' + proc_type.to_s.upcase).to_sym).call,
      #              "Proc assigned to constants should refer constants correctly in @box"
    end