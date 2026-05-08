def foo ...\n  bar(...)\n""end", __FILE__, __LINE__)
    obj5.instance_eval("def foo ...; bar(...); end", __FILE__, __LINE__)
    obj6.instance_eval('def foo(...) eval("bar(...)