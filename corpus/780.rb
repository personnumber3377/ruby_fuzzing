do'], ['{}', 'brace']],
    *|
    [%w'. dot', %w':: colon'].product(methods, blocks) do |(c, n1), (m, n2), (b, n3)|
      m = m.tr_s('()', ' ').strip if n3 == 'do'
      name = "test_#{n3}_block_after_blockcall_#{n1}_#{n2}_arg"
      code = "#{blockcall}#{c}#{m} #{b}"
      define_method(name) {assert_valid_syntax(code, bug6115)}
    end