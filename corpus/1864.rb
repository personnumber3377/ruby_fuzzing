do
  Thread.current.report_on_exception = false
  begin
    Process.kill(:INT, $$)
  ensure
    raise "in ensure"
  end