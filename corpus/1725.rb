dows
    assert_nothing_raised do
      Dir::glob("C:/*.sys") {|f| File::Stat.new(f) }
    end