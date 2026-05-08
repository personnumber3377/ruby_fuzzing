do
        assert_nothing_raised(Encoding::ConverterNotFoundError, bug11277) do
          result = th.map(&:value)
        end