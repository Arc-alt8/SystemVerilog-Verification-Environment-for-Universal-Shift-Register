interface intf;
  logic [1:0]mode;
  logic clk;
  logic rst_n;
  logic serial_in_left;
  logic serial_in_right;
  logic [3:0]parallel_in;
  logic [3:0]q;
endinterface
