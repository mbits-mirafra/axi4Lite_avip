`ifndef AXI4LITEWRITEMASTERENVCONFIG_INCLUDED_
`define AXI4LITEWRITEMASTERENVCONFIG_INCLUDED_

class Axi4LiteWriteMasterEnvConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteWriteMasterEnvConfig)
  
  int no_of_masters;

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig[];

  extern function new(string name = "Axi4LiteWriteMasterEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteWriteMasterEnvConfig

function Axi4LiteWriteMasterEnvConfig::new(string name = "Axi4LiteWriteMasterEnvConfig");
  super.new(name);
endfunction : new

function void Axi4LiteWriteMasterEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  

endfunction : do_print

`endif

