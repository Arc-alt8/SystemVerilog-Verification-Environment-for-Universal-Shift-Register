class driver;
  transaction tr;
  mailbox #(transaction) gendrive;
  virtual intf vif;

  function new(mailbox #(transaction) gendrive, virtual intf vif);
   
    this.gendrive = gendrive;
    this.vif = vif;
  endfunction

  task run();
      forever begin
      gendrive.get(tr); 

      vif.serial_in_left  <= tr.serial_in_left;
      vif.serial_in_right <= tr.serial_in_right;
      vif.mode            <= tr.mode;
      vif.parallel_in     <= tr.parallel_in;

      #2;
    end
  endtask
endclass

