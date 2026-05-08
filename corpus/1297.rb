do
      case [%(a), %q(a), %Q(a), %w(a), %W(a), %i(a), %I(a), %s(a), %x(echo a), %(), %q(), %Q(), %w(), %W(), %i(), %I(), %s(), 'a']
      in [%(a), %q(a), %Q(a), %w(a), %W(a), %i(a), %I(a), %s(a), %x(echo a), %(), %q(), %Q(), %w(), %W(), %i(), %I(), %s(), %r(a)]
        true
      end