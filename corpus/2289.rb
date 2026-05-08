do
      Class.new do
        class << self
          alias priv private
        end