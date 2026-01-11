`timescale 1ns/1ps
//==============================================================
// Digital Stopwatch
// - Start/Stop toggle
// - Reset
// - Counts seconds (0–59)
// - Pure synthesizable Verilog-2001
//==============================================================

module stopwatch #(
    parameter integer CLK_FREQ = 50_000_000  // System clock frequency (Hz)
)(
    input  wire        clk,
    input  wire        rst_n,        // Active-low asynchronous reset
    input  wire        start_stop,  // Toggle start/stop (clean pulse)
    input  wire        reset,       // Synchronous reset (clean pulse)
    output reg  [6:0]  seconds,     // 0–59
    output reg         running,
    output reg         tick_1hz
);

    // ----------------------------------------------------------
    // Clock divider to generate 1 Hz tick
    // ----------------------------------------------------------
    integer div_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            div_cnt  <= 0;
            tick_1hz <= 1'b0;
        end else begin
            if (div_cnt == CLK_FREQ - 1) begin
                div_cnt  <= 0;
                tick_1hz <= 1'b1;   // one-clock pulse
            end else begin
                div_cnt  <= div_cnt + 1;
                tick_1hz <= 1'b0;
            end
        end
    end

    // ----------------------------------------------------------
    // Start / Stop control
    // ----------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            running <= 1'b0;
        else if (reset)
            running <= 1'b0;
        else if (start_stop)
            running <= ~running;
    end

    // ----------------------------------------------------------
    // Seconds counter (0–59)
    // ----------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            seconds <= 7'd0;
        else if (reset)
            seconds <= 7'd0;
        else if (running && tick_1hz) begin
            if (seconds == 7'd59)
                seconds <= 7'd0;
            else
                seconds <= seconds + 7'd1;
        end
    end

endmodule
