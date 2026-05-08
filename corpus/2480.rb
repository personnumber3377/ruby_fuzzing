dom_range
    srand(0)
    r = Random.new(0)
    now = Time.now
    [5..9, -1000..1000, 2**100+5..2**100+9, 3.1..4, now..(now+2)].each do |range|
      3.times do
        x = rand(range)
        assert_instance_of(range.first.class, x)
        assert_equal(x, r.rand(range))
        assert_include(range, x)
      end