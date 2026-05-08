do
      EnvUtil.with_default_external(Encoding::US_ASCII) {eval <<-END, nil, __FILE__, __LINE__+1}
# coding = external
x = __ENCODING__
      END
    end