do |name|
      assert_match(/@#{name}/, ISeq.compile("", name).inspect, name)
      m = ISeq.compile("class TestISeq::Inspect; def #{name}; end