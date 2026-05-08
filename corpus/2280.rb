      class ::TestClass
        class PrivateClass
          def foo; 42; end
        end
      end
    END
    assert_equal(42, PrivateClass.new.foo)
  end

  def test_private_const_access
    assert_raise_with_message NameError, /uninitialized/ do
      begin
        eval('class ::TestClass::PrivateClass; end')
      rescue NameError
      end

      Object.const_get "NOT_AVAILABLE_CONST_NAME_#{__LINE__}"
    end
  end

  StrClone = String.clone
  Class.new(StrClone)

  def test_cloned_class
    bug5274 = StrClone.new("[ruby-dev:44460]")
    assert_equal(bug5274, Marshal.load(Marshal.dump(bug5274)))
  end

  def test_cannot_reinitialize_class_with_initialize_copy # [ruby-core:50869]
    assert_in_out_err([], "#{<<~"begin;"}\n#{<<~'end;'}", ["Object"], [])
    begin;
      class Class
        def initialize_copy(*); super; end
      end

      class A; end
      class B; end

      A.send(:initialize_copy, Class.new(B)) rescue nil

      p A.superclass
    end;
  end

  class CloneTest
    def foo; TEST; end
  end

  CloneTest1 = CloneTest.clone
  CloneTest2 = CloneTest.clone
  class CloneTest1
    TEST = :C1
  end
  class CloneTest2
    TEST = :C2
  end

  def test_constant_access_from_method_in_cloned_class
    assert_equal :C1, CloneTest1.new.foo, '[Bug #15877]'
    assert_equal :C2, CloneTest2.new.foo, '[Bug #15877]'
  end

  def test_invalid_superclass
    assert_raise(TypeError) do
      eval <<-'end;'
        class C < nil
        end
      end;
    end

    assert_raise(TypeError) do
      eval <<-'end;'
        class C < false
        end
      end;
    end

    assert_raise(TypeError) do
      eval <<-'end;'
        class C < true
        end
      end;
    end

    assert_raise(TypeError) do
      eval <<-'end;'
        class C < 0
        end
      end;
    end

    assert_raise(TypeError) do
      eval <<-'end;'
        class C < ""
        end
      end;
    end

    m = Module.new
    n = "M\u{1f5ff}"
    c = m.module_eval "class #{n}; new; end"
    assert_raise_with_message(TypeError, /#{n}/) {
      eval <<-"end;"
        class C < c
        end
      end;
    }
    assert_raise_with_message(TypeError, /#{n}/) {
      Class.new(c)
    }
    assert_raise_with_message(TypeError, /#{n}/) {
      m.module_eval "class #{n} < Class.new; end"
    }
  end

  define_method :test_invalid_reset_superclass do
    class A; end
    class SuperclassCannotBeReset < A
    end
    assert_equal A, SuperclassCannotBeReset.superclass

    assert_raise_with_message(TypeError, /superclass mismatch/) {
      class SuperclassCannotBeReset < String
      end
    }

    assert_raise_with_message(TypeError, /superclass mismatch/, "[ruby-core:75446]") {
      class SuperclassCannotBeReset < Object
      end
    }

    assert_equal A, SuperclassCannotBeReset.superclass
  end

  def test_cloned_singleton_method_added
    bug5283 = '[ruby-dev:44477]'
    added = []
    c = Class.new
    c.singleton_class.class_eval do
      define_method(:singleton_method_added) {|mid| added << [self, mid]}
      def foo; :foo; end
    end
    added.clear
    d = c.clone
    assert_empty(added.grep(->(k) {c == k[0]}), bug5283)
    assert_equal(:foo, d.foo)
  end

  def test_clone_singleton_class_exists
    klass = Class.new do
      def self.bar; :bar; end
    end

    o = klass.new
    o.singleton_class
    clone = o.clone

    assert_empty(o.singleton_class.instance_methods(false))
    assert_empty(clone.singleton_class.instance_methods(false))
    assert_empty(o.singleton_class.singleton_class.instance_methods(false))
    assert_empty(clone.singleton_class.singleton_class.instance_methods(false))
  end

  def test_clone_when_singleton_class_of_singleton_class_exists
    klass = Class.new do
      def self.bar; :bar; end
    end

    o = klass.new
    o.singleton_class.singleton_class
    clone = o.clone

    assert_empty(o.singleton_class.instance_methods(false))
    assert_empty(clone.singleton_class.instance_methods(false))
    assert_empty(o.singleton_class.singleton_class.instance_methods(false))
    assert_empty(clone.singleton_class.singleton_class.instance_methods(false))
  end

  def test_clone_when_method_exists_on_singleton_class_of_singleton_class
    klass = Class.new do
      def self.bar; :bar; end
    end

    o = klass.new
    o.singleton_class.singleton_class.define_method(:s2_method) { :s2 }
    clone = o.clone

    assert_empty(o.singleton_class.instance_methods(false))
    assert_empty(clone.singleton_class.instance_methods(false))
    assert_equal(:s2, o.singleton_class.s2_method)
    assert_equal(:s2, clone.singleton_class.s2_method)
    assert_equal([:s2_method], o.singleton_class.singleton_class.instance_methods(false))
    assert_equal([:s2_method], clone.singleton_class.singleton_class.instance_methods(false))
  end

  def test_singleton_class_p
    feature7609 = '[ruby-core:51087] [Feature #7609]'
    assert_predicate(self.singleton_class, :singleton_class?, feature7609)
    assert_not_predicate(self.class, :singleton_class?, feature7609)
  end

  def test_freeze_to_s
    assert_nothing_raised("[ruby-core:41858] [Bug #5828]") {
      Class.new.freeze.clone.to_s
    }
  end

  def test_singleton_class_of_frozen_object
    obj = Object.new
    c = obj.singleton_class
    obj.freeze
    assert_raise_with_message(FrozenError, /frozen Object/) {
      c.class_eval {def f; end}
    }
  end

  def test_singleton_class_message
    c = Class.new.freeze
    assert_raise_with_message(FrozenError, /frozen Class/) {
      def c.f; end
    }
  end

  def test_singleton_class_should_has_own_namespace
    # CONST in singleton class
    objs = []
    $i = 0

    2.times{
      objs << obj = Object.new
      class << obj
        CONST = ($i += 1)
        def foo
          CONST
        end
      end
    }
    assert_equal(1, objs[0].foo, '[Bug #10943]')
    assert_equal(2, objs[1].foo, '[Bug #10943]')

    # CONST in block in singleton class
    objs = []
    $i = 0

    2.times{
      objs << obj = Object.new
      class << obj
        1.times{
          CONST = ($i += 1)
        }
        def foo
          [nil].map{
            CONST
          }
        end
      end
    }
    assert_equal([1], objs[0].foo, '[Bug #10943]')
    assert_equal([2], objs[1].foo, '[Bug #10943]')

    # class def in singleton class
    objs = []
    $xs = []
    $i = 0

    2.times{
      objs << obj = Object.new
      class << obj
        CONST = ($i += 1)
        class X
          $xs << self
          CONST = ($i += 1)
          def foo
            CONST
          end
        end

        def x
          X
        end
      end
    }
    assert_not_equal($xs[0], $xs[1], '[Bug #10943]')
    assert_not_equal(objs[0].x, objs[1].x, '[Bug #10943]')
    assert_equal(2, $xs[0]::CONST, '[Bug #10943]')
    assert_equal(2, $xs[0].new.foo, '[Bug #10943]')
    assert_equal(4, $xs[1]::CONST, '[Bug #10943]')
    assert_equal(4, $xs[1].new.foo, '[Bug #10943]')

    # class def in block in singleton class
    objs = []
    $xs = []
    $i = 0

    2.times{
      objs << obj = Object.new
      class << obj
        1.times{
          CONST = ($i += 1)
        }
        1.times{
          class X
            $xs << self
            CONST = ($i += 1)
            def foo
              CONST
            end
          end

          def x
            X
          end
        }
      end
    }
    assert_not_equal($xs[0], $xs[1], '[Bug #10943]')
    assert_not_equal(objs[0].x, objs[1].x, '[Bug #10943]')
    assert_equal(2, $xs[0]::CONST, '[Bug #10943]')
    assert_equal(2, $xs[0].new.foo, '[Bug #10943]')
    assert_equal(4, $xs[1]::CONST, '[Bug #10943]')
    assert_equal(4, $xs[1].new.foo, '[Bug #10943]')

    # method def in singleton class
    ms = []
    ps = $test_singleton_class_shared_cref_ps = []
    2.times{
      ms << Module.new do
        class << self
          $test_singleton_class_shared_cref_ps << Proc.new{
            def xyzzy
              self
            end
          }
        end
      end
    }

    ps.each{|p| p.call} # define xyzzy methods for each singleton classes
    ms.each{|m|
      assert_equal(m, m.xyzzy, "Bug #10871")
    }
  end

  def test_namescope_error_message
    m = Module.new
    o = m.module_eval "class A\u{3042}; self; end.new"
    EnvUtil.with_default_internal(Encoding::UTF_8) do
      assert_raise_with_message(TypeError, /A\u{3042}/) {
        o::Foo
      }
    end
  end

  def test_redefinition_mismatch
    m = Module.new
    m.module_eval "A = 1", __FILE__, line = __LINE__
    e = assert_raise_with_message(TypeError, /is not a class/) {
      m.module_eval "class A; end"
    }
    assert_include(e.message, "#{__FILE__}:#{line}: previous definition")
    n = "M\u{1f5ff}"
    m.module_eval "#{n} = 42", __FILE__, line = __LINE__
    e = assert_raise_with_message(TypeError, /#{n} is not a class/) {
      m.module_eval "class #{n}; end"
    }
    assert_include(e.message, "#{__FILE__}:#{line}: previous definition")

    assert_separately([], "#{<<~"begin;"}\n#{<<~"end;"}")
    begin;
      module Bug
        module Class
          TestClassDefinedInC = (class C\u{1f5ff}; self; end).new
        end
      end
      assert_raise_with_message(TypeError, /C\u{1f5ff}/) {
        require '-test-/class'
      }
    end;
  end

  def test_should_not_expose_singleton_class_without_metaclass
    assert_normal_exit "#{<<~"begin;"}\n#{<<~'end;'}", '[Bug #11740]'
    begin;
      klass = Class.new(Array)
      # The metaclass of +klass+ should handle #bla since it should inherit methods from meta:meta:Array
      def (Array.singleton_class).bla; :bla; end
      hidden = ObjectSpace.each_object(Class).find { |c| klass.is_a? c and c.inspect.include? klass.inspect }
      raise unless hidden.nil?
    end;

    assert_normal_exit "#{<<~"begin;"}\n#{<<~'end;'}", '[Bug #11740]'
    begin;
      klass = Class.new(Array)
      klass.singleton_class
      # The metaclass of +klass+ should handle #bla since it should inherit methods from meta:meta:Array
      def (Array.singleton_class).bla; :bla; end
      hidden = ObjectSpace.each_object(Class).find { |c| klass.is_a? c and c.inspect.include? klass.inspect }
      raise if hidden.nil?
    end;

  end

  def test_assign_frozen_class_to_const
    c = Class.new.freeze
    assert_same(c, Module.new.module_eval("self::Foo = c"))
    c = Class.new.freeze
    assert_same(c, Module.new.const_set(:Foo, c))
  end

  def test_subclasses
    c = Class.new
    sc = Class.new(c)
    ssc = Class.new(sc)
    [c, sc, ssc].each do |k|
      k.include Module.new
      k.new.define_singleton_method(:force_singleton_class){}
    end
    assert_equal([sc], c.subclasses)
    assert_equal([ssc], sc.subclasses)
    assert_equal([], ssc.subclasses)

    object_subclasses = Object.subclasses
    assert_include(object_subclasses, c)
    assert_not_include(object_subclasses, sc)
    assert_not_include(object_subclasses, ssc)
    object_subclasses.each do |subclass|
      assert_equal Object, subclass.superclass, "Expected #{subclass}.superclass to be Object"
    end
  end

  def test_attached_object
    c = Class.new
    sc = c.singleton_class
    obj = c.new

    assert_equal(obj, obj.singleton_class.attached_object)
    assert_equal(c, sc.attached_object)

    assert_raise_with_message(TypeError, /is not a singleton class/) do
      c.attached_object
    end

    assert_raise_with_message(TypeError, /'NilClass' is not a singleton class/) do
      nil.singleton_class.attached_object
    end

    assert_raise_with_message(TypeError, /'FalseClass' is not a singleton class/) do
      false.singleton_class.attached_object
    end

    assert_raise_with_message(TypeError, /'TrueClass' is not a singleton class/) do
      true.singleton_class.attached_object
    end
  end

  def test_subclass_gc
    c = Class.new
    10_000.times do
      cc = Class.new(c)
      100.times { Class.new(cc) }
    end
    assert(c.subclasses.size <= 10_000)
  end

  def test_subclass_gc_stress
    10000.times do
      c = Class.new
      100.times { Class.new(c) }
      assert(c.subclasses.size <= 100)
    end
  end

  def test_classext_memory_leak
    assert_no_memory_leak([], <<-PREP, <<-CODE, rss: true)