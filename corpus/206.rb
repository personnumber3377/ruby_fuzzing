do
      EnvUtil.with_default_internal(Encoding::US_ASCII) {eval <<-END, nil, __FILE__, __LINE__+1}
# coding = internal
x = __ENCODING__
      END
    end