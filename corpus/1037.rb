dom
    assert_hash_random(:-)
    assert_hash_random(:foo)
    assert_hash_random("dsym_#{self.object_id.to_s(16)}_#{Time.now.to_i.to_s(16)}".to_sym)
  end