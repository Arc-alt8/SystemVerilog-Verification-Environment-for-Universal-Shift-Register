`include "generator.sv"

`include "driver.sv"
`include "monitor.sv"


class environment;
  generator gen;
  generator2 gen2;
  driver dri;
  monitor mon;
  mailbox #(transaction) gen1drive;
  mailbox #(transaction) gen2drive;
  mailbox #(transaction) mon2scb;
  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;
    gen1drive = new();
    gen2drive = new();
    mon2scb = new();
    gen = new(gen1drive);
    gen2 = new(gen2drive);
    dri = new(gen1drive, vif);
    mon = new(mon2scb, vif);
  endfunction

  task run();
    fork
      gen.run();
      dri.run();
      mon.run;
    join_any
    disable fork;
      dri.gendrive=gen2drive;
      fork
      gen2.run();
      dri.run();
      mon.run;
    join_any
      //disable fork;
  endtask
endclass


