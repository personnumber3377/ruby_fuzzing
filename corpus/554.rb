@@a", bb) }
    class << nil
      remove_method :test_binding
    end
  end

  def test_fixnum_instance_eval_cvar
    assert_raise(NameError, "[ruby-dev:24213]