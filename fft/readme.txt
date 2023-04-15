   _____ ______          SGen v.0.2 - A Generator of Streaming Hardware
  / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
  \__ \/ / __/ _ \/ __ \
 ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
/____/\____/\___/_/ /_/  https://github.com/fserre/sgen

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA

This archive contains the following files:
 - readme.txt: this file,
 - benchmark.v: a Verilog benchmark that can be used to test the design, and
 - design.v: the design itself, in Verilog.

This design operates on datasets of 32 elements, streamed over 16 cycles of 2 elements. This means that
each dataset has to be split into chunks of 2 elements that are input sequentially every cycle.
It has a latency of 83 cycles: the output will begin 83 cycles after the input has begun.
It supports full-throughput, which means that a new dataset may be input immediately after the previous one.
In total, this design can therefore perform a new transformation every 16 cycles.
As single RAM control is used, there must be precisely 16 cycles between datasets.
Otherwise, at least 16 additional cycles must be added to ensure that the first output dataset does not get corrupted.
Use the -dualRAMcontrol option to use dual control memory instead (use more resources).

The interface works as follows:
- clk: The input clock, a cycle begins on ascending edge.
- reset: Reset signal. It has to be set to 1 during at least one cycle before the first input, and to 0 afterwards.
- next: Signals the arrival of the next dataset. It has to be set high 6 cycles before the first inputs enter, and left at 0 otherwise.
        Particularly, it should not be set to 1 more than once every 16 cycles, as it might leave the design in a
        confused state, that can only be recovered with a reset.
- next_out: Indicates that a new dataset begins to output.
- i0 - i1: The components of the chunks of the dataset. Each of these elements is a complex number in cartesian form (real and imaginary part are concatenated, each being a 32-bits signed integer in two's complement format).
- o0 - o1: The components of the chunks of the output dataset.

If you would like to refer to this design, the following publications describe the methods used for its generation:
- Generator: F. Serre and M. Püschel, DSL-Based Hardware Generation with Scala: Example Fast Fourier Transforms and Sorting Networks, TRETS, 2019
- Streaming permutations: F. Serre, T. Holenstein and M. Püschel, Optimal Circuits for Streamed Linear Permutations using RAM, Proc. FPGA, pp. 215-223, 2016
- Algorithm folding: P. A. Milder, F. Franchetti, J. C. Hoe, and M. Püschel, Computer Generation of Hardware for Linear Digital Signal Processing Transforms, ACM TODAES, Vol. 17, No. 2, 2012
- Compact designs: F. Serre and M. Püschel, Memory-Efficient Fast Fourier Transform on Streaming Data by Fusing Permutations, Proc. FPGA, pp. 219-228, 2018
- Floating point arithmetic: F. de Dinechin and B. Pasca, Designing custom arithmetic data paths with FloPoCo, IEEE Design & Test of Computers, 28(4):18--27, 2011
