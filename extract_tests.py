import re
from pathlib import Path

interesting = []

for path in Path("test/ruby").glob("*.rb"):
    data = path.read_text(errors="ignore")

    # extract eval strings
    for m in re.finditer(r'eval\("(.*?)"\)', data, re.S):
        interesting.append(m.group(1))

    # extract heredocs
    for m in re.finditer(r'<<-\w+\n(.*?)\n\w+', data, re.S):
        interesting.append(m.group(1))

    # extract blocks
    for m in re.finditer(r'do(.*?)end', data, re.S):
        s = "do" + m.group(1) + "end"
        if len(s) < 1024:
            interesting.append(s)

out = Path("corpus")
out.mkdir(exist_ok=True)

for i, x in enumerate(interesting):
    (out / f"{i}.rb").write_text(x)