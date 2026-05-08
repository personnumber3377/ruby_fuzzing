[__FILE__, __LINE__]", nil))
    assert_equal(["(eval at #{__FILE__}:#{__LINE__})", 1], eval("[__FILE__, __LINE__]", binding))
    assert_equal(['foo', 1], eval("[__FILE__, __LINE__]", nil, 'foo'))
    assert_equal(['foo', 1], eval("[__FILE__, __LINE__]", binding, 'foo'))
    assert_equal(['foo', 2], eval("[__FILE__, __LINE__]", nil, 'foo', 2))
    assert_equal(['foo', 2], eval("[__FILE__, __LINE__]", binding, 'foo', 2))
  end

  def test_fstring_instance_eval
    bug = "[ruby-core:78116] [Bug #12930]".freeze
    assert_same bug, (bug.instance_eval {self})
    assert_raise(FrozenError) {
      bug.instance_eval {@ivar = true}
    }
  end

  def test_gced_binding_block
    assert_normal_exit %q{
      def m
        binding
      end
      GC.stress = true
      b = nil
      tap do
        b = m {}
      end
      0.times.to_a
      b.eval('yield')
    }, '[Bug #10368]'
  end

  def test_gced_eval_location
    Dir.mktmpdir do |d|
      File.write("#{d}/2.rb", "