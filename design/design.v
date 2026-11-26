module universal_shift_register(intf inf);

  always_ff @(posedge inf.clk or negedge inf.rst_n) begin
    if (!inf.rst_n) begin
            inf.q <= '0;   
        end else begin
          case (inf.mode)
                2'b00: inf.q <= inf.q;                               // Hold
                2'b01: inf.q <= {inf.serial_in_left, inf.q[3:1]};   // Shift Right
                2'b10: inf.q <= {inf.q[2:0], inf.serial_in_right};     // Shift Left
                2'b11: inf.q <= inf.parallel_in;                     // Parallel Load
                default: inf.q <= inf.q;                             // Default Hold
            endcase
        end
    end

endmodule
