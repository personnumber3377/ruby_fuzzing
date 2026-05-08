# ruby_token_mutator.py
import random
import re

MAX_LEN = 64 * 1024
last_desc = "init"

KEYWORDS = [
    "if", "unless", "while", "until", "begin", "rescue", "ensure", "end",
    "class", "module", "def", "do", "case", "when", "then", "else",
    "return", "break", "next", "redo", "retry", "yield", "super",
]

LITERALS = [
    "nil", "true", "false", "0", "1", "-1", "123", "0x41414141",
    "\"str\"", "\":sym\"", ":sym", "[]", "{}", "Object.new",
    "String.new", "Array.new", "Hash.new", "BasicObject.new",
]

OPS = [
    "+", "-", "*", "/", "%", "**", "<<", ">>", "&", "|", "^",
    "==", "!=", "<", "<=", ">", ">=", "===", "=~", "!~",
    "&&", "||",
]

CALLS = [
    ".to_s", ".inspect", ".hash", ".class", ".object_id", ".dup", ".clone",
    ".freeze", ".taint", ".itself", ".nil?", ".respond_to?(:x)",
    ".send(:object_id)", ".instance_eval { 1 }",
]

STRESS_SNIPPETS = [
    "GC.start",
    "GC.compact if GC.respond_to?(:compact)",
    "ObjectSpace.each_object(Object) { |x| x.object_id rescue nil } if defined?(ObjectSpace)",
    "begin raise 'x' rescue => e; e.backtrace; ensure 1 end",
    "lambda { |x| return x rescue nil }.call(1)",
    "proc { |x| break x rescue nil }.call(1)",
    "1.times { begin raise; rescue; retry if false; ensure; 1; end }",
    "class Object; def fuzz_m; 1; end; end",
    "Object.const_set(:FUZZ_CONST, Object.new) rescue nil",
    "eval('1 + 1')",
    "binding.eval('1 + 1')",
    "RubyVM::InstructionSequence.compile('1+1') if defined?(RubyVM::InstructionSequence)",
]

WRAPPERS = [
    "begin\n%s\nrescue Exception => e\n  e.class\nend\n",
    "begin\n%s\nensure\n  GC.start rescue nil\nend\n",
    "1.times do\n%s\nend\n",
    "lambda do\n%s\nend.call\n",
    "class FuzzClass\n%s\nend\n",
    "module FuzzModule\n%s\nend\n",
    "if Object.new\n%s\nelse\nnil\nend\n",
]

def init(seed):
    random.seed(seed)

def splice_optout():
    pass

def fuzz_count(buf):
    return 32

def tokenize(src: str):
    # Not a real Ruby lexer, but good enough for token-aware mutation.
    return re.findall(
        r"[A-Za-z_][A-Za-z0-9_]*|@[A-Za-z_][A-Za-z0-9_]*|\$[A-Za-z_][A-Za-z0-9_]*|"
        r"\d+|==|!=|<=|>=|=>|::|&&|\|\||\*\*|<<|>>|"
        r"\"(?:\\.|[^\"])*\"|'(?:\\.|[^'])*'|"
        r"[^\s]",
        src,
        re.DOTALL,
    )

def untokenize(tokens):
    out = []
    no_space_before = set(")]}.,;:")
    no_space_after = set("([{.")
    prev = ""

    for tok in tokens:
        if not out:
            out.append(tok)
        elif tok in no_space_before or prev in no_space_after:
            out.append(tok)
        else:
            out.append(" " + tok)
        prev = tok

    return "".join(out)

def rand_expr(depth=0):
    if depth > 3:
        return random.choice(LITERALS)

    choice = random.randrange(8)

    if choice == 0:
        return random.choice(LITERALS)
    if choice == 1:
        return f"({rand_expr(depth+1)} {random.choice(OPS)} {rand_expr(depth+1)})"
    if choice == 2:
        return f"[{rand_expr(depth+1)}, {rand_expr(depth+1)}]"
    if choice == 3:
        return f"{{ :a => {rand_expr(depth+1)}, :b => {rand_expr(depth+1)} }}"
    if choice == 4:
        return f"{rand_expr(depth+1)}{random.choice(CALLS)}"
    if choice == 5:
        return f"begin {rand_expr(depth+1)} rescue {rand_expr(depth+1)} ensure {rand_expr(depth+1)} end"
    if choice == 6:
        return f"lambda {{ |x| {rand_expr(depth+1)} }}.call({rand_expr(depth+1)})"

    return f"({rand_expr(depth+1)}; {rand_expr(depth+1)})"

def rand_stmt():
    choice = random.randrange(10)

    if choice == 0:
        return rand_expr()
    if choice == 1:
        return f"x = {rand_expr()}"
    if choice == 2:
        return f"def fuzz_method_{random.randrange(100)}(x = {rand_expr()}); {rand_expr()}; end"
    if choice == 3:
        return f"begin\n{rand_expr()}\nrescue Exception => e\n{rand_expr()}\nensure\n{rand_expr()}\nend"
    if choice == 4:
        return f"3.times do |i|\n{rand_expr()}\nend"
    if choice == 5:
        return f"case {rand_expr()}\nwhen {rand_expr()}\n{rand_expr()}\nelse\n{rand_expr()}\nend"
    if choice == 6:
        return f"class C{random.randrange(100)}\ndef m(x); {rand_expr()}; end\nend"
    if choice == 7:
        return random.choice(STRESS_SNIPPETS)
    if choice == 8:
        return f"eval({rand_expr()}.to_s) rescue nil"

    return f"RubyVM::InstructionSequence.compile({rand_expr()}.to_s) rescue nil"

def generate_program():
    n = random.randint(3, 30)
    body = "\n".join(rand_stmt() for _ in range(n))

    if random.random() < 0.5:
        body = random.choice(WRAPPERS) % body

    return body

def mutate_existing(src):
    global last_desc

    tokens = tokenize(src)
    if not tokens or random.random() < 0.25:
        last_desc = "generate_program"
        return generate_program()

    mutation = random.choice([
        "insert_token",
        "delete_token",
        "replace_token",
        "duplicate_range",
        "wrap_program",
        "append_stmt",
        "prepend_stmt",
        "insert_expr",
        "stress_snippet",
    ])

    if mutation == "insert_token":
        pos = random.randrange(len(tokens) + 1)
        tokens.insert(pos, random.choice(KEYWORDS + LITERALS + OPS))
        out = untokenize(tokens)

    elif mutation == "delete_token":
        pos = random.randrange(len(tokens))
        del tokens[pos]
        out = untokenize(tokens)

    elif mutation == "replace_token":
        pos = random.randrange(len(tokens))
        tokens[pos] = random.choice(KEYWORDS + LITERALS + OPS)
        out = untokenize(tokens)

    elif mutation == "duplicate_range":
        a = random.randrange(len(tokens))
        b = min(len(tokens), a + random.randint(1, 16))
        pos = random.randrange(len(tokens) + 1)
        tokens[pos:pos] = tokens[a:b]
        out = untokenize(tokens)

    elif mutation == "wrap_program":
        out = random.choice(WRAPPERS) % src

    elif mutation == "append_stmt":
        out = src + "\n" + rand_stmt() + "\n"

    elif mutation == "prepend_stmt":
        out = rand_stmt() + "\n" + src

    elif mutation == "insert_expr":
        out = src + "\np(" + rand_expr() + ") rescue nil\n"

    else:
        out = src + "\n" + random.choice(STRESS_SNIPPETS) + "\n"

    last_desc = mutation
    return out

def fuzz(buf, add_buf, max_size):
    try:
        src = bytes(buf).decode("utf-8", errors="ignore")
    except Exception:
        src = ""

    if random.random() < 0.15:
        out = generate_program()
    else:
        out = mutate_existing(src)

    out_b = out.encode("utf-8", errors="ignore")

    limit = min(max_size, MAX_LEN)
    if len(out_b) > limit:
        out_b = out_b[:limit]

    return out_b

def havoc_mutation(buf, max_size):
    return fuzz(buf, None, max_size)

def havoc_mutation_probability():
    return 20

def describe(max_description_length):
    return last_desc[:max_description_length]

def introspection():
    return last_desc

def init_trim(buf):
    return 0