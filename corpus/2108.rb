does_not_change_after_compaction
    omit "compaction is not supported on this platform" unless GC.respond_to?(:compact)

    # iseq backed method
    assert_separately([], <<~RUBY)
      def a; end