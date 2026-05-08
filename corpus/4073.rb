do |name|
    define_method("test_strip_bom:#{name}") do
      path = "#{name}-bom.txt"
      with_tmpdir {
        text = "\uFEFF\u0100a"
        stripped = "\u0100a"
        content = text.encode(name)
        generate_file(path, content)
        result = File.read(path, mode: 'rb:BOM|UTF-8')
        assert_equal(Encoding.find(name), result.encoding, name)
        assert_equal(content[1..-1].b, result.b, name)
        %w[rb rt r].each do |mode|
          message = "#{name}, mode: #{mode.dump}"
          result = File.read(path, mode: "#{mode}:BOM|UTF-8:UTF-8")
          assert_equal(Encoding::UTF_8, result.encoding, message)
          assert_equal(stripped, result, message)
        end