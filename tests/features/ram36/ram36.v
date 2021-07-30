// Copyright (C) 2021  The Symbiflow Authors.
//
// Use of this source code is governed by a ISC-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/ISC
//
// SPDX-License-Identifier: ISC

module ram0(
    // Write port
    input wrclk,
    input [15:0] di,
    input wren,
    input [10:0] wraddr,
    // Read port
    input rdclk,
    input rden,
    input [10:0] rdaddr,
    output reg [15:0] do);

    (* ram_style = "block" *) reg [15:0] ram[0:2047];

    integer i;
    initial begin
        for (i=0; (i<2048); i=(i+1)) begin
            if ( i % 10 == 0)
                ram[i] = 16'b00000000_00000001;
            else if ( i % 10 == 1)
                ram[i] = 16'b10101010_10101010;
            else if ( i % 10 == 2)
                ram[i] = 16'b01010101_01010101;
            else if ( i % 10 == 3)
                ram[i] = 16'b11111111_11111111;
            else if ( i % 10 == 4)
                ram[i] = 16'b11110000_11110000;
            else if ( i % 10 == 5)
                ram[i] = 16'b00001111_00001111;
            else if ( i % 10 == 6)
                ram[i] = 16'b11001100_11001100;
            else if ( i % 10 == 7)
                ram[i] = 16'b00110011_00110011;
            else if ( i % 10 == 8)
                ram[i] = 16'b00000000_00000010;
            else if ( i % 10 == 9)
                ram[i] = 16'b00000000_00000100;
        end
    end

    always @ (posedge wrclk) begin
        if(wren) begin
            ram[wraddr] <= di;
        end
    end

    always @ (posedge rdclk) begin
        if(rden) begin
            do <= ram[rdaddr];
        end
    end
endmodule

module top (
    input  wire clk,

    input  wire rx,
    output wire tx,

    input  wire butu,
    input  wire butd,
    input  wire butl,
    input  wire butr,
    input  wire butc,

    input  wire [15:0] sw,
    output wire [15:0] led
);
    wire rden;
    reg wren;
    wire [10:0] rdaddr;
    wire [10:0] wraddr;
    wire [15:0] di;
    wire [15:0] do;
    ram0 ram(
        .wrclk(clk),
        .di(di),
        .wren(wren),
        .wraddr(wraddr),
        .rdclk(clk),
        .rden(rden),
        .rdaddr(rdaddr),
        .do(do)
    );

    reg [10:0] address_reg;
    reg [15:0] data_reg;
    reg [15:0] out_reg;

    assign rdaddr = address_reg;
    assign wraddr = address_reg;

    // display_mode == 00 -> ram[address_reg]
    // display_mode == 01 -> address_reg
    // display_mode == 10 -> data_reg
    wire [1:0] display_mode;

    // input_mode == 00 -> in[9:0] -> address_reg
    // input_mode == 01 -> in[7:0] -> data_reg[7:0]
    // input_mode == 10 -> in[7:0] -> data_reg[15:8]
    // input_mode == 11 -> data_reg -> ram[address_reg]
    wire [1:0] input_mode;

    // WE == 0 -> address_reg and data_reg unchanged.
    // WE == 1 -> address_reg or data_reg is updated because on input_mode.
    wire we;

    assign display_mode[0] = sw[14];
    assign display_mode[1] = sw[15];

    assign input_mode[0] = sw[12];
    assign input_mode[1] = sw[13];

    assign we = butc;
    assign led = out_reg;
    assign di = data_reg;
    assign rden = 1;

    initial begin
        address_reg = 10'b0;
        data_reg = 16'b0;
        out_reg = 16'b0;
    end

    always @ (posedge clk) begin
        if(display_mode == 0) begin
            out_reg <= do;
        end else if(display_mode == 1) begin
            out_reg <= address_reg;
        end else if(display_mode == 2) begin
            out_reg <= data_reg;
        end

        if(input_mode == 0) begin
            address_reg <= sw[10:0];
            wren <= 0;
        end else if(input_mode == 1) begin
            data_reg[7:0] <= sw[7:0];
            wren <= 0;
        end else if(input_mode == 2) begin
            data_reg[15:8] <= sw[7:0];
            wren <= 0;
        end else if(input_mode == 3 && we == 1) begin
            wren <= 1;
        end
    end

    // Uart loopback
    assign tx = rx;
endmodule
