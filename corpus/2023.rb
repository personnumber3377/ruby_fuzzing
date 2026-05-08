do |user|
      assert_raise_with_message(ArgumentError, /#{user}/) {Dir.home(user)}
    end