# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
import apytypes as apy
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test a fixed-point two-bit divider")

    # Set the input values you want to test
    a = apy.fx(1.0, int_bits=2, frac_bits=2)
    b = apy.fx(0.5, int_bits=2, frac_bits=2)

    dut.ui_in.value = a.to_bits() << 4 and b.to_bits()

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 2)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    assert dut.uo_out.value == apy.fx(2.0, int_bits=4, frac_bits=4)

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
