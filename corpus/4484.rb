def initialize(x) @r\xe9sum\xe9 = x; end".force_encoding(iso_8859_1))
  end
  const_set("R\xe9sum\xe92".force_encoding(iso_8859_1), classISO8859_1)
  classISO8859_1.name
  ClassISO8859_1 = classISO8859_1

  moduleUTF8 = const_set("C\u{30af 30e9 30b9}", Module.new)
  moduleUTF8.name
  ModuleUTF8 = moduleUTF8

  def test_nonascii_class_instance
    a = ClassUTF8.new
    assert_instance_of(ClassUTF8, Marshal.load(Marshal.dump(a)), '[ruby-core:24790]')

    bug1932 = '[ruby-core:24882]'

    a = StructISO8859_1.new(10)
    assert_nothing_raised(bug1932) do
      assert_equal(a, Marshal.load(Marshal.dump(a)), bug1932)
    end
    a.__send__("#{StructISO8859_1.members[0]}=", a)
    assert_nothing_raised(bug1932) do
      assert_equal(a, Marshal.load(Marshal.dump(a)), bug1932)
    end

    a = ClassISO8859_1.new(10)
    assert_nothing_raised(bug1932) do
      b = Marshal.load(Marshal.dump(a))
      assert_equal(ClassISO8859_1, b.class, bug1932)
      assert_equal(a.instance_variables, b.instance_variables, bug1932)
      a.instance_variables.each do |i|
        assert_equal(a.instance_variable_get(i), b.instance_variable_get(i), bug1932)
      end
    end
    a.__send__(a.methods(true).grep(/=\z/)[0], a)
    assert_nothing_raised(bug1932) do
      b = Marshal.load(Marshal.dump(a))
      assert_equal(ClassISO8859_1, b.class, bug1932)
      assert_equal(a.instance_variables, b.instance_variables, bug1932)
      assert_equal(b, b.instance_variable_get(a.instance_variables[0]), bug1932)
    end
  end

  def test_nonascii_class_module
    assert_same(ClassUTF8, Marshal.load(Marshal.dump(ClassUTF8)))
    assert_same(ClassISO8859_1, Marshal.load(Marshal.dump(ClassISO8859_1)))
    assert_same(ModuleUTF8, Marshal.load(Marshal.dump(ModuleUTF8)))
  end

  def test_regexp2
    assert_equal(/\\u/, Marshal.load("\004\b/\b\\\\u\000