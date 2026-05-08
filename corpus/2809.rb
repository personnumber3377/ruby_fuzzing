do
          1000.times do |i|
            define_method(:"foo_#{i}") {}

            alias :"foo_#{i}" :"foo_#{i}"

            remove_method :"foo_#{i}"
          end