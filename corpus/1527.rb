do |arg_str|
      node = RubyVM::AbstractSyntaxTree.parse("def a(#{arg_str}) end