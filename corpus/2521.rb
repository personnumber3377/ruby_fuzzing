do
      undef require
      alias require old_require
      undef old_require
    end