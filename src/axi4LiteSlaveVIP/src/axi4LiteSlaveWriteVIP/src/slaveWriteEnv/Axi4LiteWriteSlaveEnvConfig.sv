`ifndef AXI4LITEWRITESLAVEENVCONFIG_INCLUDED_
`define AXI4LITEWRITESLAVEENVCONFIG_INCLUDED_

class Axi4LiteWriteSlaveEnvConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteWriteSlaveEnvConfig)
  
  int no_of_slaves;

  Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig[];

  extern function new(string name = "Axi4LiteWriteSlaveEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteWriteSlaveEnvConfig

function Axi4LiteWriteSlaveEnvConfig::new(string name = "Axi4LiteWriteSlaveEnvConfig");
  super.new(name);
endfunction : new

function void Axi4LiteWriteSlaveEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  

endfunction : do_print

`endif

