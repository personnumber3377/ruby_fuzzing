do |name, msg|
      expected = "wrong constant name %s" % name
      msg = "#{msg}#{': ' if msg}wrong constant name #{name.dump}"
      assert_raise_with_message(NameError, Regexp.compile(Regexp.quote(expected)), "#{msg} to #{m}") do
        yield name
      end