dom'

# These test the functionality of object shapes
class TestShapes < Test::Unit::TestCase
  MANY_IVS = 80

  class IVOrder
    def expected_ivs
      %w{ @a @b @c @d @e @f @g @h @i @j @k }
    end