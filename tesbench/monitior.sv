class monitor;
  transaction tr;
  mailbox #(transaction) mon2scb;
  virtual intf vif;

  function new(mailbox #(transaction) mon2scb, virtual intf vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      #2;
      tr = new();
      tr.serial_in_left = vif.serial_in_left;
      tr.serial_in_right = vif.serial_in_right;
      tr.mode[1:0] = vif.mode[1:0];
      tr.parallel_in[3:0] = vif.parallel_in[3:0];
      //tr.b = vif.b;
      tr.q = vif.q;
      mon2scb.put(tr);
    end
  endtask
endclass
