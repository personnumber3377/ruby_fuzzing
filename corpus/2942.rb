does_not_change_after_compaction
    omit "compaction is not supported on this platform" unless GC.respond_to?(:compact)

    # [Bug #20853]
    [
      "proc {}", # iseq backed proc
      "{}.to_proc", # ifunc backed proc
      ":hello.to_proc", # symbol backed proc
    ].each do |proc|
      assert_separately([], <<~RUBY)
        p1 = #{proc}
        hash = p1.hash

        GC.verify_compaction_references(expand_heap: true, toward: :empty)

        assert_equal(hash, p1.hash, "proc is `#{proc}`")
      RUBY
    end