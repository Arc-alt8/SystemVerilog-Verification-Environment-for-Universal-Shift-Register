`include "env.sv"

module test(intf inf);
  environment env;

  initial begin
    env = new(inf);
    env.run();
  end
endmodule
