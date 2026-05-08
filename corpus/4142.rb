do |enc|
      assert_separately(%W[-d - #{enc.name}], <<-EOS, ignore_stderr: true)
    Encoding.default_external = ext = ARGV[0]
    Encoding.default_internal = int ='utf-8'
    assert_nothing_raised do
      Encoding::Converter.new(ext, int)
    end