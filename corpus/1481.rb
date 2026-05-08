do |e|
      assert_equal([], e.lazy.take(0).map(&:itself).to_a)
      assert_equal([], e.lazy.take(0).select(&:even?).to_a)
      assert_equal([], e.lazy.take(0).select(&:odd?).to_a)
      assert_equal([], e.lazy.take(0).reject(&:even?).to_a)
      assert_equal([], e.lazy.take(0).reject(&:odd?).to_a)
      assert_equal([], e.lazy.take(0).take(1).to_a)
      assert_equal([], e.lazy.take(0).take(0).take(1).to_a)
      assert_equal([], e.lazy.take(0).drop(0).to_a)
      assert_equal([], e.lazy.take(0).find_all {|_| true}.to_a)
      assert_equal([], e.lazy.take(0).zip((12..20)).to_a)
      assert_equal([], e.lazy.take(0).uniq.to_a)
      assert_equal([], e.lazy.take(0).sort.to_a)
    end