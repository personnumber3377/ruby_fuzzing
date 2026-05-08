do |o|
      ancestry = o.singleton_class.ancestors
      ancestry[ancestry.index(o.singleton_class)] = :singleton_class
      ancestry
    end