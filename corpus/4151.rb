doble
    m = MemoryViewTestUtils
    packed = [1.23].pack("d")
    assert_equal(1.23, m.extract_item_members(packed, "d"))
  end