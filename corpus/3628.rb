dows = /bccwin|mswin|mingw/ =~ RUBY_PLATFORM
  IGNORE_CASE = windows
  ENCODING = windows ? Encoding::UTF_8 : Encoding.find("locale")
  PATH_ENV = "PATH"
  INVALID_ENVVARS = [
    "foo\0bar",
    "\xa1\xa1".force_encoding(Encoding::UTF_16LE),
    "foo".force_encoding(Encoding::ISO_2022_JP),
  ]

  def assert_invalid_env(msg = nil)
    all_assertions(msg) do |a|
      INVALID_ENVVARS.each do |v|
        a.for(v) do
          assert_raise(ArgumentError) {yield v}
        end