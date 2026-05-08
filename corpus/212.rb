dot_in_next_line
    x = nil
    assert_nothing_raised do
      eval <<-END, nil, __FILE__, __LINE__+1
        x = 1
        .to_s
      END
    end