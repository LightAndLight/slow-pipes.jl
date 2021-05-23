# slow-pipes.jl

`PipeEndpoint`s are really, really, slow. Instead of using `Base.stdin`,
use `open("/dev/stdin")` to make sure you obtain an `IOStream`.

Replication:

```
./gen_input

# slow paths
cat input.txt | /usr/bin/env time julia main.jl
/usr/bin/env time julia main.jl < input.txt

patch main.jl fast.patch

# fast paths
cat input.txt | /usr/bin/env time julia main.jl
/usr/bin/env time julia main.jl < input.txt
```