`ifndef AXI4LITEREADMASTERENVCONFIG_INCLUDED_
`define AXI4LITEREADMASTERENVCONFIG_INCLUDED_

class Axi4LiteReadMasterEnvConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteReadMasterEnvConfig)
  
  int no_of_masters;

  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfig[];

  extern function new(string name = "Axi4LiteReadMasterEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteReadMasterEnvConfig

function Axi4LiteReadMasterEnvConfig::new(string name = "Axi4LiteReadMasterEnvConfig");
  super.new(name);
endfunction : new

function void Axi4LiteReadMasterEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  

endfunction : do_print

`endif

