do |path|
    define_method("test_all_tokens:#{path}") do
      node = EnvUtil.suppress_warning { RubyVM::AbstractSyntaxTree.parse_file("#{SRCDIR}/#{path}", keep_tokens: true) }
      tokens = node.all_tokens.sort_by { [_1.last[0], _1.last[1]] }
      tokens_bytes = tokens.map { _1[2]}.join.bytes
      source_bytes = File.read("#{SRCDIR}/#{path}").bytes

      assert_equal(source_bytes, tokens_bytes)

      (tokens.count - 1).times do |i|
        token_0 = tokens[i]
        token_1 = tokens[i + 1]
        end