#{meth}(*OVER_STACK_ARGV)", __FILE__, __LINE__)
      end
    end
  end

  def test_call_iseq_large_array_splat_pass
    def self.a(*a); a.length end
    assert_equal OVER_STACK_LEN, a(*OVER_STACK_ARGV)

    def self.b(_, *a); a.length end
    assert_equal (OVER_STACK_LEN - 1), b(*OVER_STACK_ARGV)

    def self.c(_, *a, _); a.length end
    assert_equal (OVER_STACK_LEN - 2), c(*OVER_STACK_ARGV)

    def self.d(b=1, *a); a.length end
    assert_equal (OVER_STACK_LEN - 1), d(*OVER_STACK_ARGV)

    def self.e(b=1, *a, _); a.length end
    assert_equal (OVER_STACK_LEN - 2), e(*OVER_STACK_ARGV)

    def self.f(b, *a); a.length end
    assert_equal (OVER_STACK_LEN - 1), f(*OVER_STACK_ARGV)

    def self.g(*a, k: 1); a.length end
    assert_equal OVER_STACK_LEN, g(*OVER_STACK_ARGV)

    def self.h(*a, **kw); a.length end
    assert_equal OVER_STACK_LEN, h(*OVER_STACK_ARGV)

    def self.i(*a, k: 1, **kw); a.length end
    assert_equal OVER_STACK_LEN, i(*OVER_STACK_ARGV)

    def self.j(b=1, *a, k: 1); a.length end
    assert_equal (OVER_STACK_LEN - 1), j(*OVER_STACK_ARGV)

    def self.k(b=1, *a, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 1), k(*OVER_STACK_ARGV)

    def self.l(b=1, *a, k: 1, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 1), l(*OVER_STACK_ARGV)

    def self.m(b=1, *a, _, k: 1); a.length end
    assert_equal (OVER_STACK_LEN - 2), m(*OVER_STACK_ARGV)

    def self.n(b=1, *a, _, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 2), n(*OVER_STACK_ARGV)

    def self.o(b=1, *a, _, k: 1, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 2), o(*OVER_STACK_ARGV)
  end

  def test_call_iseq_large_array_splat_with_large_number_of_parameters
    args = OVER_STACK_ARGV.map{|i| "a#{i}"}.join(',')
    args1 = (OVER_STACK_LEN-1).times.map{|i| "a#{i}"}.join(',')

    singleton_class.class_eval("def a(#{args}); [#{args}] end