don't want to check if exit_locations hash
    # is not empty because that could indicate a bug in the exit
    # locations collection.
    return unless run_script[:enabled]
    exit_locations = run_script[:exit_locations]

    assert exit_locations.key?(:raw)
    assert exit_locations.key?(:frames)
    assert exit_locations.key?(:lines)
    assert exit_locations.key?(:samples)
    assert exit_locations.key?(:missed_samples)
    assert exit_locations.key?(:gc_samples)

    assert_equal 0, exit_locations[:missed_samples]
    assert_equal 0, exit_locations[:gc_samples]

    assert_not_empty exit_locations[:raw]
    assert_not_empty exit_locations[:frames]
    assert_not_empty exit_locations[:lines]

    exit_locations[:frames].each do |frame_id, frame|
      assert frame.key?(:name)
      assert frame.key?(:file)
      assert frame.key?(:samples)
      assert frame.key?(:total_samples)
      assert frame.key?(:edges)
    end