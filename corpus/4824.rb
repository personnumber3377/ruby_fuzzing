Bug3123", TOPLEVEL_BINDING)}
    assert_not_match(/Object::/, e.message, bug3123)
  end

  def test_attr_inherited_visibility
    bug3406 = '[ruby-core:30638]'
    c = Class.new do
      class << self
        private
        def attr_accessor(*); super; end
      end
      attr_accessor :x
    end.new
    assert_nothing_raised(bug3406) {c.x = 1}
    assert_equal(1, c.x, bug3406)
  end

  def test_attr_writer_with_no_arguments
    bug8540 = "[ruby-core:55543]"
    c = Class.new do
      attr_writer :foo
    end
    assert_raise(ArgumentError, bug8540) { c.new.send :foo= }
  end

  def test_private_constant_in_class
    c = Class.new
    c.const_set(:FOO, "foo