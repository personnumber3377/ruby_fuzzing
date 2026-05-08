do
        def self.lookup(hash, key) = hash[key]

        def self.foo(a, b) = []

        def self.test(hash, key)
          [lookup(hash, key), key, "".freeze]
          # 05 opt_send