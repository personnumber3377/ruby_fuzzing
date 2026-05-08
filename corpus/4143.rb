do |type|
    name = :"#{type}_ALIGNMENT"
    const_set(name, MemoryViewTestUtils.const_get(name))
  end