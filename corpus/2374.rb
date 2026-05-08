down_heaps
    omit if GC::INTERNAL_CONSTANTS[:SIZE_POOL_COUNT] == 1

    assert_separately(%w[-robjspace], "#{<<~"begin;"}\n#{<<~"end