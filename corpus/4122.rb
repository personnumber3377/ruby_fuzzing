dom/formatter'

module Random::Formatter
  module FormatterTest
    def test_random_bytes
      assert_equal(16, @it.random_bytes.size)
      assert_equal(Encoding::ASCII_8BIT, @it.random_bytes.encoding)
      65.times do |idx|
        assert_equal(idx, @it.random_bytes(idx).size)
      end