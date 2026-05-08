do
      RubyVM::AbstractSyntaxTree.parse(%{->(; foo) {}})
    end