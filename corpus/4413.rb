do |desc, o|
      e = assert_raise(NameError, "#{desc} iv removal raises before set") do
        o.remove_instance_variable(:@foo)
      end