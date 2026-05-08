do/next
  def test_break
    done = true
    loop{
      break if true
      done = false			# should not reach here
    }
    assert(done)

    done = false
    bad = false
    loop {
      break if done
      done = true
      next if true
      bad = true			# should not reach here
    }
    assert(!bad)

    done = false
    bad = false
    loop {
      break if done
      done = true
      redo if true
      bad = true			# should not reach here
    }
    assert(!bad)

    x = []
    for i in 1 .. 7
      x.push i
    end