do |n|
      text = "#{"0" * n}ABC"
      assert text.match?(re)
    end