do |f|
      assert_warning('', bug6324) {
        f.set_encoding("eucjp:euc-jp")
      }
      assert_warning('', bug6324) {
        f.set_encoding("eucjp", "euc-jp")
      }
      assert_warning('', bug6324) {
        f.set_encoding(Encoding::EUC_JP, "euc-jp")
      }
      assert_warning('', bug6324) {
        f.set_encoding("eucjp", Encoding::EUC_JP)
      }
      assert_warning('', bug6324) {
        f.set_encoding(Encoding::EUC_JP, Encoding::EUC_JP)
      }
      nonstr = Object.new
      def nonstr.to_str; "eucjp"; end