dom.rand(4)}
    r1, r2 = *assert_fork_status(2, bug5661) {Random.rand}
    assert_not_equal(r1, r2, bug5661)

    assert_fork_status(1, bug5661) {rand(4)}
    r1, r2 = *assert_fork_status(2, bug5661) {rand}
    assert_not_equal(r1, r2, bug5661)

    stable = Random.new
    assert_fork_status(1, bug5661) {stable.rand(4)}
    r1, r2 = *assert_fork_status(2, bug5661) {stable.rand}
    assert_equal(r1, r2, bug5661)

    assert_fork_status(1, '[ruby-core:82100] [Bug #13753]') do
      Random.rand(4)
    end