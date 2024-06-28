`ifndef AXI4LITEREADSLAVEENVCONFIG_INCLUDED_
`define AXI4LITEREADSLAVEENVCONFIG_INCLUDED_

class Axi4LiteReadSlaveEnvConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteReadSlaveEnvConfig)
  
  int no_of_slaves;

  Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfig[];

  extern function new(string name = "Axi4LiteReadSlaveEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteReadSlaveEnvConfig

function Axi4LiteReadSlaveEnvConfig::new(string name = "Axi4LiteReadSlaveEnvConfig");
  super.new(name);
endfunction : new

function void Axi4LiteReadSlaveEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  

endfunction : do_print

`endif

