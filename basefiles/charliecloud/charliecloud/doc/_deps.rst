Building Charliecloud
~~~~~~~~~~~~~~~~~~~~~

required:

  * C99 compiler

optional:

  * extended glob patterns in --unset-env

:code:`ch-run` internal SquashFS mounting:

  * enabled
  * libfuse3
  * libsquashfuse_ll
  * ll.h header

fake system calls with seccomp(2):

  * enabled
  * tested working

documentation:

  * :code:`sphinx-build` ≥ 1.2.3
  * :code:`sphinx-build` Python
  * "docutils" module ≥ 0.14
  * "sphinx-rtd-theme" module ≥ 0.2.4

Building images
~~~~~~~~~~~~~~~

with Buildah (warning: not tested; see issue #990):

  * Buildah ≥ 1.11.2

with :code:`ch-image`:

  * enabled
  * Python shebang line
  * Python in shebang ≥ 3.6
  * "lark" module
  * "requests" module ≥ 2.6.0
  * :code:`ch-run`

with :code:`ch-image` using build cache:

  * :code:`ch-image`:

  * Git ≥ 2.28.1

with Docker:

  * Docker ≥ 17.03
  * :code:`mktemp`

Managing container images
~~~~~~~~~~~~~~~~~~~~~~~~~

build from Dockerfile:

  * at least one builder
  * access to an image repository

pack images from builder storage to tarball:

  * at least one builder

pack images from builder storage to SquashFS:

  * at least one builder
  * :code:`mksquashfs` ≥ 4.2

Note: Pulling/pushing images from/to a repository is currently done using
the builder directly.

Running containers
~~~~~~~~~~~~~~~~~~

:code:`ch-run`:

  * user+mount namespaces

run SquashFS images:

  * manual mount with SquashFUSE ≥ 0.1.100
  * internal mount with libsquashfuse

inject nVidia GPU libraries:

  * :code:`nvidia-container-cli` ≥ 1.0.0
  * nVidia libraries & executables present

Test suite
~~~~~~~~~~

basic tests, all stages:

  * test suite enabled
  * :code:`ch-run`
  * any builder above
  * access to Docker Hub or mirror
  * Bats ≥ 1.2.0
  * Bash ≥ 4.1
  * :code:`wget` ≥ 1.11

more complete tests:

  * basic tests
  * documentation built
  * ShellCheck ≥ 0.9.0
  * generic sudo

debugging tests:

  * more tests
  * DOT ≥ 2.30.1
  * git2dot ≥ 0.8.3

recommended tests, tar-unpack mode:

  * basic tests
  * more tests

recommended tests, squash-unpack mode:

  * basic tests
  * more tests
  * pack/unpack SquashFS images

recommended tests, squash-mount mode:

  * recommended, squash-unpack mode:

  * internal SquashFS mounting

