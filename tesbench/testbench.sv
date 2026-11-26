`include "test.sv"
`include "interface.sv"


module top;
  intf inf();
  test tb(inf);
  universal_shift_register dut(inf);
  
    initial inf.clk = 0;
  always #2inf.clk = ~inf.clk;

  initial begin
    inf.rst_n = 1;
    #20 inf.rst_n = 0;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top);
    #100;
    $finish;
  end
endmodule
