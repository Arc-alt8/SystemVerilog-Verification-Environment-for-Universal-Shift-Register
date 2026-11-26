`include "transaction.sv"
class generator;
  transaction tr;
  mailbox #(transaction) gen1drive;

  function new(mailbox #(transaction) gen1drive);
    this.gen1drive = gen1drive;
  endfunction

  task run();
    repeat (10) begin
      tr = new();
      if (!tr.randomize()) $fatal("Randomization failed");
      gen1drive.put(tr);
     
    end
  endtask
endclass



class generator2;
  transaction tr;
  mailbox #(transaction) gen2drive;

  function new(mailbox #(transaction) gen2drive);
    this.gen2drive = gen2drive;
  endfunction

  task run();
    repeat (10) begin
      tr = new();
      if (!tr.randomize()) $fatal("Randomization failed");
      gen2drive.put(tr);
    end
  endtask
endclass



        
