down_heaps
    omit if GC::INTERNAL_CONSTANTS[:SIZE_POOL_COUNT] == 1
    # AR and ST hashes are in the same size pool on 32 bit
    omit unless RbConfig::SIZEOF["uint64_t"] <= RbConfig::SIZEOF["void*"]

    assert_separately(%w[-robjspace], "#{<<~"begin;"}\n#{<<~"end