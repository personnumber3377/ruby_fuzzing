doesn't transition to frozen shape in this case
    assert_predicate RubyVM::Shape.of(tc), :too_complex?
  end