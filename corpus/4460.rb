dom.new}
    assert_not_initialize_copy {//}
    assert_not_initialize_copy {/.*/.match("foo")}
    st = Struct.new(:foo)
    assert_not_initialize_copy {st.new}
  end