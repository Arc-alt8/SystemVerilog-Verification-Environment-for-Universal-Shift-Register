class transaction;
  rand bit serial_in_left;
  rand bit serial_in_right;
  rand bit [3:0]parallel_in;
  rand bit [1:0] mode;
  bit clk;
  bit rst_n;
  bit [3:0]q;
  bit [3:0]count;
endclass
