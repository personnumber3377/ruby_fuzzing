dout
    assert_raise(TypeError) { $> = Object.new }

    assert_in_out_err([], "$> = $stderr\nputs 'foo'", [], %w(foo))

    assert_separately(%w[-Eutf-8], "#{<<~"begin;"}\n#{<<~"end