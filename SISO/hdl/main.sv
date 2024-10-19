module SISO
(
    input  wire  clk,
    input  wire  rst,
    input  wire  d_in,
    output  wire  d_out
);

    wire q0,  q1, q2;
    always @(posedge clk or negedge rst) begin : FF1_reg_PROC
        if(!rst) begin
            q0 <= 1'b0;
        end else begin
            q0 <= d_in;
        end
    end: FF1_reg_PROC

    always @(posedge clk or negedge rst) begin : reg_PROC
        if(!rst) begin
            q1 <= 1'b0;
        end else begin
            q1 <= q0;
        end
    end

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            q2 <= 1'b0;
        end else begin
            q2 <= q1;
        end
    end

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            d_out <= 1'b0;
        end else begin
            d_out <= q2;
        end
    end

endmodule