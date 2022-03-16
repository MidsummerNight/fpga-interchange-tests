// Copyright (C) 2021  The Symbiflow Authors.
//
// Use of this source code is governed by a ISC-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/ISC
//
// SPDX-License-Identifier: ISC

`timescale 1ns / 1ps

module toplevel(
    input   io_mainClk,
    output  io_uart_txd,
    input   io_uart_rxd,
    input [3:0] sw,
    output [4:0] io_led
  );

  wire [31:0] io_gpioA_read;
  wire [31:0] io_gpioA_write;
  wire [31:0] io_gpioA_writeEnable;
  wire io_mainClk;
  wire io_jtag_tck;
  wire io_jtag_tdi;
  wire io_jtag_tdo;
  wire io_jtag_tms;
  wire io_uart_txd;
  wire io_uart_rxd;

  assign io_led = io_gpioA_write[4: 0];
  assign io_gpioA_read[7:0] = sw;

  Murax murax (
    .io_asyncReset(0),
    .io_mainClk (io_mainClk),
    .io_jtag_tck(1'b0),
    .io_jtag_tdi(1'b0),
    .io_jtag_tms(1'b0),
    .io_gpioA_read       (io_gpioA_read),
    .io_gpioA_write      (io_gpioA_write),
    .io_gpioA_writeEnable(io_gpioA_writeEnable),
    .io_uart_txd(io_uart_txd),
    .io_uart_rxd(io_uart_rxd)
  );
endmodule

