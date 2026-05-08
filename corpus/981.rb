    class Foo
      def initialize
        @raise = false
      end

      def hash
        raise if @raise
        @raise = true
        return 0
      end
    end
    h = {Foo.new => true}
    EOS

    code = <<-EOS
    10_0000.times do
      h.rehash rescue nil
    end
    GC.start
    EOS

    assert_no_memory_leak([], prepare, code, bug9187)
  end

  def test_memory_size_after_delete
    require 'objspace'
    h = {}
    1000.times {|i| h[i] = true}
    big = ObjectSpace.memsize_of(h)
    1000.times {|i| h.delete(i)}
    assert_operator ObjectSpace.memsize_of(h), :<, big/10
  end

  def test_wrapper
    bug9381 = '[ruby-core:59638] [Bug #9381]'

    wrapper = Class.new do
      def initialize(obj)
        @obj = obj
      end

      def hash
        @obj.hash
      end

      def eql?(other)
        @obj.eql?(other)
      end
    end

    bad = [
      5, true, false, nil,
      0.0, 1.72723e-77,
      :foo, "dsym_#{self.object_id.to_s(16)}_#{Time.now.to_i.to_s(16)}".to_sym,
      "str",
    ].select do |x|
      hash = {x => bug9381}
      hash[wrapper.new(x)] != bug9381
    end
    assert_empty(bad, bug9381)
  end

  def assert_hash_random(obj, dump = obj.inspect)
    a = [obj.hash.to_s]
    3.times {
      assert_in_out_err(["-e", "print (#{dump}).hash"], "") do |r, e|
        a += r
        assert_equal([], e)
      end
    }
    assert_not_equal([obj.hash.to_s], a.uniq)
    assert_operator(a.uniq.size, :>, 2, proc {a.inspect})
  end

  def test_string_hash_random
    assert_hash_random('abc')
  end

  def test_symbol_hash_random
    assert_hash_random(:-)
    assert_hash_random(:foo)
    assert_hash_random("dsym_#{self.object_id.to_s(16)}_#{Time.now.to_i.to_s(16)}".to_sym)
  end

  def test_integer_hash_random
    assert_hash_random(0)
    assert_hash_random(+1)
    assert_hash_random(-1)
    assert_hash_random(+(1<<100))
    assert_hash_random(-(1<<100))
  end

  def test_float_hash_random
    assert_hash_random(0.0)
    assert_hash_random(+1.0)
    assert_hash_random(-1.0)
    assert_hash_random(1.72723e-77)
    assert_hash_random(Float::INFINITY, "Float::INFINITY")
  end

  def test_label_syntax
    feature4935 = '[ruby-core:37553] [Feature #4935]'
    x = 'world'
    hash = assert_nothing_raised(SyntaxError, feature4935) do
      break eval(%q({foo: 1, "foo-bar": 2, "hello-#{x}": 3, 'hello-#{x}': 4, 'bar': {}}))
    end
    assert_equal({:foo => 1, :'foo-bar' => 2, :'hello-world' => 3, :'hello-#{x}' => 4, :bar => {}}, hash, feature4935)
    x = x
  end

  def test_broken_hash_value
    bug14218 = '[ruby-core:84395] [Bug #14218]'

    assert_equal(0, 1_000_000.times.count{a=Object.new.hash; b=Object.new.hash; a < 0 && b < 0 && a + b > 0}, bug14218)
    assert_equal(0, 1_000_000.times.count{a=Object.new.hash; b=Object.new.hash; 0 + a + b != 0 + b + a}, bug14218)
  end

  def test_reserved_hash_val
    s = Struct.new(:hash)
    h = {}
    keys = [*0..8]
    keys.each {|i| h[s.new(i)]=true}
    msg = proc {h.inspect}
    assert_equal(keys, h.keys.map(&:hash), msg)
  end

  ruby2_keywords def get_flagged_hash(*args)
    args.last
  end

  def check_flagged_hash(k: :NG)
    k
  end

  def test_ruby2_keywords_hash?
    flagged_hash = get_flagged_hash(k: 1)
    assert_equal(true, Hash.ruby2_keywords_hash?(flagged_hash))
    assert_equal(false, Hash.ruby2_keywords_hash?({}))
    assert_raise(TypeError) { Hash.ruby2_keywords_hash?(1) }
  end

  def test_ruby2_keywords_hash
    hash = {k: 1}
    assert_equal(false, Hash.ruby2_keywords_hash?(hash))
    hash = Hash.ruby2_keywords_hash(hash)
    assert_equal(true, Hash.ruby2_keywords_hash?(hash))
    assert_equal(1, check_flagged_hash(*[hash]))
    assert_raise(TypeError) { Hash.ruby2_keywords_hash(1) }
  end

  def ar2st_object
    class << (obj = Object.new)
      attr_reader :h
    end
    obj.instance_variable_set(:@h, {})
    def obj.hash
      10.times{|i| @h[i] = i}
      0
    end
    def obj.inspect
      'test'
    end
    def obj.eql? other
      other.class == Object
    end
    obj
  end

  def test_ar2st_insert
    obj = ar2st_object
    h = obj.h

    h[obj] = true
    assert_equal '{0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, test => true}', h.inspect
  end

  def test_ar2st_delete
    obj = ar2st_object
    h = obj.h

    obj2 = Object.new
    def obj2.hash
      0
    end

    h[obj2] = true
    h.delete obj
    assert_equal '{0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9}', h.inspect
  end

  def test_ar2st_lookup
    obj = ar2st_object
    h = obj.h

    obj2 = Object.new
    def obj2.hash
      0
    end

    h[obj2] = true
    assert_equal true, h[obj]
  end

  def test_bug_12706
    assert_raise(ArgumentError) do
      {a: 1}.each(&->(k, v) {})
    end
  end

  def test_bug_21357
    h = {x: []}.merge(x: nil) { |_k, v1, _v2| v1 }
    assert_equal({x: []}, h)
  end

  def test_any_hash_fixable
    20.times do
      assert_separately([], "#{<<~"begin;"}\n#{<<~'end;'}")
      begin;
        require "delegate"
        typename = DelegateClass(String)

        hash = {
          "Int" => true,
          "Float" => true,
          "String" => true,
          "Boolean" => true,
          "WidgetFilter" => true,
          "WidgetAggregation" => true,
          "WidgetEdge" => true,
          "WidgetSortOrder" => true,
          "WidgetGrouping" => true,
        }

        hash.each_key do |key|
          assert_send([hash, :key?, typename.new(key)])
        end
      end;
    end
  end

  def test_compare_by_identity_during_iteration
    h = { 1 => 1 }
    h.each do
      assert_raise(RuntimeError, "compare_by_identity during iteration") do
        h.compare_by_identity
      end
    end
  end

  def test_ar_hash_to_st_hash
    assert_normal_exit("#{<<~"begin;"}\n#{<<~'end;'}", 'https://bugs.ruby-lang.org/issues/20050#note-5')
    begin;
      srand(0)
      class Foo
        def to_a
          []
        end

        def hash
          $h.delete($h.keys.sample) if rand < 0.1
          to_a.hash
        end
      end

      1000.times do
        $h = {}
        (0..10).each {|i| $h[Foo.new] ||= {} }
      end
    end;
  end

  def test_ar_to_st_reserved_value
    klass = Class.new do
      attr_reader :hash
      def initialize(val) = @hash = val
    end

    values = 0.downto(-16).to_a
    hash = {}
    values.each do |val|
      hash[klass.new(val)] = val
    end
    assert_equal values, hash.values, "[ruby-core:121239] [Bug #21170]"
  end