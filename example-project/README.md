# example-project

An example project demonstrating how to build a binary with [`afl`](http://lcamtuf.coredump.cx/afl/)
and test in parallel it using [Docker Compose](https://docs.docker.com/compose/).

It works by building the project into a Docker image which is then used to
start multiple containers running a fuzzer.
Each container shares the same output [volume](https://docs.docker.com/engine/admin/volumes/volumes/)
so that the results may be synchronised between each fuzzer.

To automatically build the image (containing the binary) and start up a
parallelised run with one primary fuzzer and `n` secondary fuzzers, execute:

```bash
$ docker-compose up --scale secondary=$n
```

`--build` can be appended to force a rebuild of the image should the source
be changed between runs.
