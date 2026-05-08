do |format, expected|
      actual, err = MemoryViewTestUtils.item_size_from_format(format)
      assert_nil(err)
      assert_equal(expected, actual, "rb_memory_view_item_size_from_format(#{format || 'NULL'}) == #{expected}")
    end