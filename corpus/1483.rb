do |args|
      block = args.pop
      assert_equal [1, 2, 3].to_enum.to_enum(*args).first(2).to_a, [1, 2, 3].to_enum.lazy.to_enum(*args).first(2).to_a
      assert_equal (0..50).to_enum.to_enum(*args).first(2).to_a, (0..50000).to_enum.lazy.to_enum(*args).first(2).to_a
      if block
        assert_equal [1, 2, 3, 4].to_enum.to_enum(*args).map(&block).first(2).to_a, [1, 2, 3, 4].to_enum.lazy.to_enum(*args).map(&block).first(2).to_a
        unless args.first == :take_while || args.first == :drop_while
          assert_equal (0..50).to_enum.to_enum(*args).map(&block).first(2).to_a, (0..50000).to_enum.lazy.to_enum(*args).map(&block).first(2).to_a
        end