# Instructions

*Step 1*, download a nightly version of alire at

<https://github.com/alire-project/alire/releases/tag/nightly>

and install it.

The Linux version is a bit picky w.r.t. the GLIBC version. If the binary
cannot be launched, I will send you a version that we have compiled
ourselves and which works on older Linux versions.

*Step 2*, get alire's source code

We need to use a slightly patched version, as the public one is not
entirely compatible with GNAT SAS.
git clone <git@github.com>:yakobowski/alire.git -b
feature/Address-gnatpro-warnings
cd alire
alr exec -- echo
mkdir -p
alire/cache/dependencies/libgpr_23.0.0_34e332b9/gpr/lib/production/static

Finally add the line 'for Externally_Built use "true";' (without the single
quotes) in the file
./alire/cache/dependencies/libgpr_23.0.0_34e332b9/gpr/gpr.gpr, just after
the line 'library project GPR is'

This is to be speed up the analysis by removing a big component

*Step 3*, analyze Alire's source code

Just launch

alr exec -- gnatsas analyze -P alr.gpr --text -j0
from the sources directory

alr exec -- gnatsas report sarif -P alr.gpr -o report.sarif
