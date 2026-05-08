recv = self; recv.using Module.new", Sandbox::BINDING)
    end
  end

  def test_no_kernel_using
    assert_raise(NoMethodError) do
      using Module.new
    end
  end

  class UsingClass
  end

  def test_module_using_class
    assert_raise(TypeError) do
      eval("using TestRefinement::UsingClass", Sandbox::BINDING)
    end
  end

  def test_refine_without_block
    c1 = Class.new
    assert_raise_with_message(ArgumentError, "no block given