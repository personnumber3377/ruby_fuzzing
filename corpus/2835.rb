do |tmpdir|
      tmp = File.join(tmpdir, 'x')
      File.open(tmp, 'wb', :encoding => Encoding::EUC_JP) do |x|
        assert_equal Encoding::EUC_JP, x.external_encoding
      end