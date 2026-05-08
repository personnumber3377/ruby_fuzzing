do |h, age|
    h[age] = [/\A\p{age=#{age}}+\z/u, /\A\P{age=#{age}}+\z/u].freeze
  end